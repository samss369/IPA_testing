import 'package:flutter/material.dart';
import 'constant.dart';
import 'login_screen.dart';

void main() {
  runApp(InitialScreen());
}

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      title: appname,
      debugShowCheckedModeBanner: false,
    );
  }
}
