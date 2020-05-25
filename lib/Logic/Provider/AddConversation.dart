
import 'package:flutter/material.dart';

class ConversationError with ChangeNotifier{
  String message = "";
  void setMessage(String message){
    this.message = message;
    notifyListeners();
  } 
}