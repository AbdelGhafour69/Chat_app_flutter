import 'package:firebase_auth/firebase_auth.dart';

class User {
  String id;
  String photo;
  FirebaseUser user;
  String name;
  bool status;
  User(FirebaseUser user) {
    this.user = user;
  }
  User.fromfirestore(Map<String,dynamic> json){
    name = json["fullname"];
    status = json["status"];
  }
  User.fromJson(Map<String, dynamic> json, FirebaseUser usr) {
    name = json["fullname"];
    status = json["status"];
    this.user=usr;
  }
  Map<String, dynamic> toJson() => {
        'fullname': name,
        'status':status
      };
}
