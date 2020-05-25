import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/ConversationLogic.dart';
import 'package:messages/Logic/Message.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/ChatPage/MessageContainer.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String id;
  User other;
  String userid;
  ChatPage(this.id, this.other);
  Future<void> callback() async {
    if (messageController.text.length > 0) {
      addmessage(id, other.id, userid , messageController.text);
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    final sawsan = Provider.of<UserProvider>(context);
    userid = sawsan.user.user.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: yellowy,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection("User")
                  .document(sawsan.user.user.uid)
                  .collection("Conversations")
                  .document(id)
                  .collection("messages")
                  .orderBy("sent")
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                if (snapshot.data.documents.length == 0)
                  return Center(
                    child: Text("Such Empty"),
                  );
                return ListView.builder(
                  controller: scrollController,
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    Message msg =
                        Message.fromjson(snapshot.data.documents[index].data);
                    return MessageContainer(msg);
                  },
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom:20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: "Enter a Message...",
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                FlatButton(
                  child: Icon(Icons.send),
                  onPressed: () {
                    callback();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


