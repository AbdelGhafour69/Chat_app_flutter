import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/Conversation.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/View/User/WelcomePage/Conversationcard.dart';
import 'package:provider/provider.dart';

class Conversations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<UserProvider>(context);
    return StreamBuilder(
      stream: Firestore.instance
          .collection("User")
          .document(userinfo.user.user.uid)
          .collection("Conversations")
          .orderBy("lastmodified")
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data == null)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (snapshot.data.documents.length == 0)
          return Center(
            child: Text("Wow such empty"),
          );
        var docs = snapshot.data.documents;
        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            Conversation convo = Conversation.fromJson(docs[index].data);
            convo.id = docs[index].documentID;
            return ChangeNotifierProvider<UserProvider>.value(
              value: userinfo,
              child: Conversationcard(convo),
            );
          },
        );
      },
    );
  }
}
