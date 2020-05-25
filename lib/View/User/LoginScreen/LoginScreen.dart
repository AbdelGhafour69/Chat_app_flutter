import 'package:flutter/material.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/LoginScreen/Bottomsignup.dart';
import 'package:messages/View/User/LoginScreen/LoginForm.dart';
import 'package:messages/View/User/LoginScreen/LoginTitileBubles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            LoginLine(),
            LoginForm(),
            BottomSignup()
          ],
        ),
      ),
    );
  }
}
