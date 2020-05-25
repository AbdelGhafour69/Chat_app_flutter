import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/LoginSignup.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/View/Style.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatelessWidget {
  String email, password, verif,name;
  final GlobalKey<FormState> key2 = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final sawsan = Provider.of<SignUp>(context);
    return Container(
      margin: EdgeInsets.only(top: 60, left: 20, right: 20),
      padding: EdgeInsets.all(20),
      height: 395,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 20,
            offset: Offset(3, -2), // changes position of shadow
          ),
        ],
      ),
      child: Form(
        key: key2,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom:10),
              child: Text(
                sawsan.message,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ),
             Container(
              height: 50,
              child: TextFormField(
                 validator: (input){
                  if(input.isEmpty){
                    return 'Full name is required';
                  }
                },
                onSaved: (input) => name = input.trim(),
                decoration: new InputDecoration(
                  focusColor: greeny,
                  hoverColor: greeny,
                  labelText: "Full name",
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
                 validator: (input){
                  if(!EmailValidator.validate(input)){
                    return 'Email invalid';
                  }
                },
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
                 validator: (input){
                  if(input.length <8){
                    return 'Password too shot';
                  }
                },
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
            Container(
              height: 50,
              child: TextFormField(
                onSaved: (input) => verif = input,
                validator: (input){
                  if(input!= password){
                    return 'Password not the same';
                  }
                },
                decoration: new InputDecoration(
                  focusColor: greeny,
                  hoverColor: greeny,
                  labelText: "Retype password",
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
                key2.currentState.save();
                if (key2.currentState.validate()) {
                  signup(email, password,context,name);
                }
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
