import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_user_login/constants.dart';

import 'package:flutter_svg/svg.dart';
import 'package:firebase_user_login/screens/HomeScreen.dart';
import './background.dart';
import 'package:firebase_user_login/components/rounded_button.dart';

class Body extends StatelessWidget {
  Body({
    Key key,
  }) : super(key: key);

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<void> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          user: user,
                        )));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (AuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Enter the OTP"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  Container(
                    child: RoundedButton(
                      text: ("Submit"),
                      textColor: Colors.white,
                      color: kPrimaryColor,
                      press: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);

                        AuthResult result =
                            await _auth.signInWithCredential(credential);

                        FirebaseUser user = result.user;

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                        user: user,
                                      )));
                        } else {
                          print("Error");
                        }
                      },
                    ),
                  )
                ],
              );
            },
          );
        },
        codeAutoRetrievalTimeout: null);
  }

// The above given code is the main Logic for OTP Validation via Firebase by Ashok Mali ( Github Ashok9589 )

// ****************************************************************************************

//Sample UI

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Enter Your Mobile Number",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              width: 280,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Mobile Number'),
                controller: _phoneController,
              ),
            ),
            Container(
              child: RoundedButton(
                text: "LOGIN",
                press: () {
                  print("Login Button Pressed");
                  final phone = _phoneController.text.trim();
                  loginUser(phone, context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
