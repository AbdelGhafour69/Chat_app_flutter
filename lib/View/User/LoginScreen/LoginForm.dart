import 'package:flutter/material.dart';
import 'package:messages/Logic/LoginSignup.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/View/Style.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    final sawsan = Provider.of<SignIn>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 20,
            offset: Offset(3, -4), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 130, right: 20, left: 20),
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      height: 250,
      width: 400,
      child: Form(
        key: key,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom:10),
              child: sawsan.waiting? LinearProgressIndicator() : Text(
                sawsan.message,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,
              child: TextFormField(
                onSaved: (input) => email = input.trim(),
                decoration: new InputDecoration(
                  focusColor: greeny,
                  hoverColor: greeny,
                  labelText: "Email",
                  fillColor: Colors.black,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(color: greeny),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: hismessage,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: TextFormField(
                onSaved: (input) => password = input,
                decoration: new InputDecoration(
                  focusColor: greeny,
                  hoverColor: greeny,
                  labelText: "Password",
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(color: greeny),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: hismessage,
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: greeny,
              onPressed: () {
                key.currentState.save();
                login(email, password,context);
              },
              child: Text(
                "Submit",
                style: title,
              ),
            )
          ],
        ),
      ),
    );
  }
}
