import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qizotask/apptext.dart';
import 'package:qizotask/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

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

        leading: IconButton(
          icon: Icon(Icons.menu,color: Colors.white,),
          onPressed: (){},
        ),

      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                          'User Name:',style: TextStyle(color: Colors.black)
                      ),
                    )),
                Expanded(
                    child: TextFormField(
                      controller: usernamecontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text('Email'), enabledBorder: OutlineInputBorder(
                          borderRadius:  BorderRadius.all(Radius.circular(10)),
                          borderSide: const BorderSide(width: 1,color: Colors.black)
                      ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width:1,color: Colors.grey)),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                          'Password   :',style: TextStyle(color: Colors.black)
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: TextFormField(
                        controller: passwordcontroller,
                        decoration: InputDecoration(
                          label: Text('password'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:  BorderRadius.all(Radius.circular(10)),
                              borderSide: const BorderSide(width: 1,color: Colors.black)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(width:1,color: Colors.grey)),
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40,left: 20),
                  child: InkWell(
                      onTap: (){
                          // sendData();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(

                          )));

                      },
                      child: Container(
                          height: 52,
                          width: 147,
                          decoration: BoxDecoration(
                              color: const Color(0xff5e025e),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: AppText(
                                text: "OK",
                                color: Colors.white,
                                size: 12,
                                fw: FontWeight.bold,
                              )))
                          ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: InkWell(
                      onTap: () {
                      },
                      child: Container(
                          height: 52,
                          width: 147,
                          decoration: BoxDecoration(
                              color: Color(0xff5e025e),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: AppText(
                                text: "Cancel",
                                color: Colors.white,
                                size: 12,
                                fw: FontWeight.bold,
                              )))),
                )


              ],
            ),

          ],
        ),
      ),
    );
  }
}
