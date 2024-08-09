# flutter6

A new Flutter project.                                              

**********************************************************************
*                                                                    *
* #################### FINAL PROJECT V_1 ##########################  *
*                                                                    *
**********************************************************************

######################################################################

**********************colors******************************************
import 'package:flutter/material.dart';

const Color primarycolor = Color.fromARGB(255, 104, 8, 104);


######################################################################

*********************************constant*****************************

const String appname = "Aarican Tech";
const String Slogan = "We create impossible | We serve trustworthy";
const String bgimage = "assets/images/bg3.png";
const String titlelogo = "assets/images/banner.png";
const String hmimage = "assets/biglogo2.jpg";
const String lgname = "Aarican Technologies";
const String loginname = "LOGIN";
const String forgettext = "Forget Password ?";



########################################################################

*****************************create_account*****************************

import 'package:flutter/material.dart';
import 'home_screen.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
        backgroundColor: const Color.fromARGB(255, 150, 34, 170),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Create Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    // Perform sign up action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Account created successfully!')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}


####################################################################

*******************************login_screen*************************
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

###########################################################################

****************************home_screen************************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'led.dart';

class HomePage extends StatefulWidget {
  final bool showAlert;

  const HomePage({Key? key, this.showAlert = false}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    if (widget.showAlert) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOfflineDialog(context);
      });
    }
  }

  void _launchURL() async {
    const url = 'https://www.aaricantechnologies.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showOfflineDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text(
              "Device is offline!\nCheck Repllent Device Connectivity......"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 232, 195, 236),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to Aarican Tech',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 146, 53, 155),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 135,
                    child: Icon(
                      Icons.bar_chart_rounded,
                      color: Color.fromARGB(255, 161, 63, 181),
                      size: 28,
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 32),
                    Center(
                      child: Image.asset(
                        'assets/images/hm_image.png',
                        height: height * 0.30,
                        width: width * 0.30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'SERVICES',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _cardMenu(
                          onTap: _launchURL,
                          icon: 'assets/images/about_img.png',
                          title: 'About',
                          color: Color.fromARGB(255, 220, 83, 254),
                          fontColor: Colors.white,
                        ),
                        SizedBox(height: 5),
                        _cardMenu(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyLedPage(),
                              ),
                            );
                          },
                          icon: 'assets/images/CARLOGO_2.png',
                          title: 'REPELLENT',
                          color: Color.fromARGB(255, 220, 83, 254),
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 200,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }
}


###########################################################################################

****************************function_page*******************************
import 'dart:convert';
import 'package:http/http.dart' as http;

// Future<String?> extractAliveAck(final String urlname) async {
//   final url = Uri.parse(urlname);
//   try {
//     final response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       // Decode the body field which contains another JSON string
//       final bodyData = json.decode(data['body']);

//       // Extract the specific fields
//       final String aliveAck = bodyData['alive'];
//       print("a $aliveAck");
//       return aliveAck;
//     } else {
//       return "404 error";
//     }
//   } catch (e) {
//     return "failed";
//   }
// }

// Future<String?> extractStatusAck(String urlname) async {
//   final url = Uri.parse(urlname);
//   try {
//     final response =
//         await http.get(url, headers: {'Content-Type': 'application/json'});

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);

//       // Decode the body field which contains another JSON string
//       final bodyData = json.decode(data['body']);

//       // Extract the specific fields
//       String statusAck = bodyData['status'];
//       print("b $statusAck");

//       return statusAck;
//     } else {
//       return null;
//     }
//   } catch (e) {
//     return "failed";
//   }
// }

Future<Map<String, String?>> extractAliveAndStatusAck(
    final String urlname) async {
  final url = Uri.parse(urlname);
  try {
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Decode the body field which contains another JSON string
      final bodyData = json.decode(data['body']);

      // Extract the specific fields
      final String? aliveAck = bodyData['alive'];
      final String? statusAck = bodyData['status'];

      return {
        'alive': aliveAck,
        'status': statusAck,
      };
    } else {
      return {
        'alive': null,
        'status': null,
      };
    }
  } catch (e) {
    return {
      'alive': 'failed',
      'status': 'failed',
    };
  }
}
/*
void main() async {
  final result = await extractAliveAndStatusAck('https://example.com/api');

  final aliveAck = result['alive'];
  print("Alive Ack: $aliveAck");

  final statusAck = result['status'];
  print("Status Ack: $statusAck");
}
*/

#########################################################################################

***************************led.dart***********************************

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'function_page.dart';
import 'home_screen.dart';

class MyLedPage extends StatefulWidget {
  const MyLedPage({super.key});

  @override
  _MyLedPageState createState() => _MyLedPageState();
}

class _MyLedPageState extends State<MyLedPage> {
  String? statusAck;
  String? aliveAck;
  //bool toggle = false;
  final String urlname =
      'https://v9ynxtbaw9.execute-api.ap-south-1.amazonaws.com/Dev/shadow-resource';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    //_callExtractAliveAck();
    // _callExtractStatusAck();
    _hello();
    //print(aliveAck);
    //print(aliveAck);
    if (aliveAck == "off") {
      _timer?.cancel();
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(showAlert: true)),
        );
      });
    }
    _startAutoRefresh();
  }

  void _startAutoRefresh() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      //_callExtractAliveAck();
      // _callExtractStatusAck();
      _hello();
      print(aliveAck);
      //_callExtractAliveAck();
      // _callExtractAliveAck();
      if (aliveAck == "off") {
        _timer?.cancel();
        Future.delayed(Duration.zero, () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage(showAlert: true)),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _hello() async {
    final result = await extractAliveAndStatusAck(urlname);
    setState(() {
      aliveAck = result['alive'];
      statusAck = result['status'];
    });
    // aliveAck = result['alive'];
    // //print("Alive Ack: $aliveAck");

    // statusAck = result['status'];
    //print("Status Ack: $statusAck");
  }

  // void _callExtractAliveAck() async {
  //   String? aliveAck1 = await extractAliveAck(urlname);
  //   setState(() {
  //     aliveAck = aliveAck1;
  //     //print(aliveAck);
  //   });
  // }

  // void _callExtractStatusAck() async {
  //   String? statusAck1 = await extractStatusAck(urlname);
  //   setState(() {
  //     if (statusAck1 != "null") statusAck = statusAck1;
  //   });
  // }

  Future<void> _toggleLED() async {
    //_callExtractStatusAck();
    String thingName = "";
    final url = Uri.parse(urlname);
    print("Status Ack: $statusAck");
    final action = statusAck == 'on' ? 'on' : 'off';
    final payload = {
      'thingname': thingName,
      'action': action,
    };

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(payload),
      );

      if (response.statusCode == 200) {
        setState(() {
          // if (action == 'on') {
          //   if (statusAck != 'null') {
          //     //toggle = false;
          //   }
          // }
          // if (action == 'off') {
          //   if (statusAck != 'null') {
          //     // toggle = true;
          //   }
          // }
        });
      } else {
        setState(() {});
      }
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            // Text(
            //action:
            //_callExtractAliveAck();
            //child:
            Text(aliveAck == "on" ? 'online' : 'offline'),
            // ),
            const SizedBox(height: 20),
            Text(statusAck == 'on' ? 'On' : 'Off'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLED,
              child: Text(statusAck == "on" ? 'Turn On LED' : 'Turn Off LED'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
