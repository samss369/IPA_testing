import 'package:flutter/material.dart';

import 'colors.dart';
import 'constant.dart';
import 'create_account_page.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  //String _email = "";
  //String _password = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(
                    bgimage,
                    height: height * 0.20,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: height * 0.20,
                    width: width,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            stops: [0.1, 1],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.white])),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  lgname,
                  style: TextStyle(
                      color: Color.fromARGB(255, 106, 13, 122),
                      fontWeight: FontWeight.w800,
                      fontSize: 30),
                ),
              ),
              const Center(
                child: Text(
                  Slogan,
                  style: TextStyle(
                      color: Color.fromARGB(255, 177, 65, 197),
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, top: 20, bottom: 20.0),
                  child: Container(
                    child: Text(
                      "  $loginname  ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primarycolor.withOpacity(0.3),
                            primarycolor.withOpacity(0.1)
                          ],
                        ),
                        border: Border(
                            left: BorderSide(color: primarycolor, width: 8))),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  child: TextFormField(
                    onSaved: (value) {
                      //   _email = value!;
                    },
                    /* validator: (email) {
                      if (email?.isEmpty ?? true)
                        return "Please enter Email";
                      else if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(email!))
                        return "Enter valid Email ID";
                      else
                        return null;
                    },
                    */
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(Icons.email, color: primarycolor),
                        labelText: "EMAIL ADDRESS",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 16)),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: TextFormField(
                    onSaved: (value) {
                      //   _password = value!;
                    },
                    /*validator: (password) {
                      if (password?.isEmpty ?? true) {
                        return "Enter Password";
                      } else if (password!.length < 8 || password.length > 15)
                        return "Enter valid Password";
                      else
                        return null;
                    },
                    */
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: primarycolor)),
                        prefixIcon: Icon(Icons.lock, color: primarycolor),
                        labelText: "PASSWORD",
                        labelStyle:
                            TextStyle(color: primarycolor, fontSize: 16)),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(forgettext),
                  )),
              Center(
                child: SizedBox(
                  height: height * 0.08,
                  width: width - 80,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: primarycolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(80),
                        ),
                      ),
                    ),
                    onPressed: () {
                      //if (formkey.currentState!.validate()) {
                      //  formkey.currentState?.save();
                      //print(_email);
                      //print(_password);
                      // if (_email == "hi@gmail.com" &&
                      //    _password == "123456789") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      //   } else {
                      //      print("Invalid Login Details");
                    },
                    // }
                    // },
                    child: Text(
                      "Login to account",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountPage(),
                        ),
                      );
                    },
                    child: Text("Create new account"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
