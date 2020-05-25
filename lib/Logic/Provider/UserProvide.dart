
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/User.dart';

class UserProvider with ChangeNotifier{
  User user;
  void setuser(User usr){
    this.user = usr;
    print("ffs work "+this.user.name+" "+this.user.user.uid);
  }
}