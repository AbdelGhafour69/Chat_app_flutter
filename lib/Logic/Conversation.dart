import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation{
  String id;
  String other;
  bool from;
  String lastmessage;
  Timestamp lastmodified;
  Conversation(this.other,this.from,this.lastmessage,this.lastmodified);

   Conversation.fromJson(Map<String, dynamic> json) {
     other = json["with"];
     from = json["from"];
     lastmodified = json["lastmodified"];
     lastmessage = json["lastmessage"];
  }

}