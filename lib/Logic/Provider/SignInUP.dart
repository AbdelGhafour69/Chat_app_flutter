import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class SignIn with ChangeNotifier{
  String message="";
  bool waiting=false;
  setMessage(String msg){
    message= msg;
    notifyListeners();
  }
  setwaiting(bool ting){
    waiting = ting;
    message = "";
    notifyListeners();
  }
}

class SignUp with ChangeNotifier{
  String message ="";
  bool waiting = false;
  setMessage(String msg){
    message = msg;
    notifyListeners();
  }
  setwaiting(bool ting){
    waiting = ting;
    message="";
    notifyListeners();
  }
}