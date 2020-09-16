import 'package:firebase_user_login/screens/Login/login_screen.dart';
// import 'package:firebase_user_login/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OTP Validation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreenn(),
    );
  }
}
