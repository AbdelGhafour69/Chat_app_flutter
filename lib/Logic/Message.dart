import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  bool from;
  Timestamp sent;
  String message;
  Message(this.from,this.message,this.sent);
  Message.fromjson(Map<String,dynamic> json){
    from = json["from"];
    sent = json["sent"];
    message = json["message"];
  }

   Map<String, dynamic> toJson() => {
        'from': from,
        'message':message,
        'sent' : sent
      };
}