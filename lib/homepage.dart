import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qizotask/iteams.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Item>> _items;
  Future<List<Item>> GetData() async {
    var response = await get(Uri.parse("http://luckyapi.qizo.in/api/mcompanyprofiles"),);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final items = <Item>[];

      for (var itemData in jsonData) {
        final item = Item(
          name: itemData['companyProfileName'],
          mail_name: itemData['companyProfileMailingName'],
          address: itemData['companyProfileAddress1']
        );
        items.add(item);
        print(items);
      }

      return items;
    } else {
      throw Exception('Failed to fetch items from the database.');
    }

  }

  @override
  void initState()  {
    super.initState();
    _items =( GetData()) ;
    print('my org list:${_items.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.10,
        backgroundColor: const Color(0xff5e025e),
        title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Qizo')
        ),

      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _items,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {
                final items = snapshot.data!;


                return DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Mailing Name')),
                    DataColumn(label: Text('Address')),
                  ],
                  rows: snapshot.data!.map((item) {
                    return DataRow(cells: [
                      DataCell(Text(item.name)),
                      DataCell(Text(item.mail_name)),
                      DataCell(Text(item.address)),

                    ]);
                  }).toList(),
                );
              } else if (snapshot.hasError) {
                return Text('Failed to fetch items from the database.');
              }

              return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
