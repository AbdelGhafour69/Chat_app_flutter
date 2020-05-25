import 'package:flutter/material.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/View/User/LoginScreen/LoginScreen.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType=null;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider<SignIn>.value(value: SignIn()),
        ChangeNotifierProvider<SignUp>.value(value: SignUp()),
        ChangeNotifierProvider<UserProvider>.value(value: UserProvider()),
      ],
      child: LoginScreen(),
    ),
  ));
}
