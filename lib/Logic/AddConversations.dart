import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_admin/src/credential.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/Provider/AddConversation.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:provider/provider.dart';

Future<void> startConversation(String uid, BuildContext context) async {
  final user = Provider.of<UserProvider>(context,listen: false);
  final errors = Provider.of<ConversationError>(context,listen: false);
  if (user.user.user.uid == uid) {
    errors.setMessage("Can't start conversation with yourself");
  } else {
    addConversation(uid, user.user.user.uid, context);
  }
}

Future<void> addConversation(
    String userid, String seconduser, BuildContext context) async {
  await Firestore.instance
      .collection("User")
      .document(userid)
      .get()
      .then((value) async {
    if (!value.exists) {
      final errors = Provider.of<ConversationError>(context, listen: false);
      errors.setMessage("No user with this id");
    } else {
      await Firestore.instance
          .collection("User")
          .document(userid)
          .collection("Conversations")
          .add({
        "from": null,
        "with": seconduser,
        "lastmodified": Timestamp.now(),
        "lastmessage": ""
      });
      await Firestore.instance
          .collection("User")
          .document(seconduser)
          .collection("Conversations")
          .add(
        {
          "from": null,
          "with": userid,
          "lastmodified": Timestamp.now(),
          "lastmessage": ""
        },
      );
    }
  });
}
