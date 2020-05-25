import 'package:flutter/material.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/LoginScreen/Bottomsignup.dart';
import 'package:messages/View/User/LoginScreen/LoginTitileBubles.dart';
import 'package:messages/View/User/RegistrationScreen/SignUpForm.dart';
import 'package:provider/provider.dart';

class RegistratioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left:20),
                  child: Text(
                    "SignUP",
                    style: titleblack,
                  ),
                ),
                Bubles(),
              ],
            ),
            SignUpForm(),
            Container(
              margin: EdgeInsets.only(top: 90, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BublesLeft(),
                  Container(
                  margin: EdgeInsets.only(left: 20),
                  child: GestureDetector(
                    child: Text(
                      "Login",
                      style: titleblack,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
