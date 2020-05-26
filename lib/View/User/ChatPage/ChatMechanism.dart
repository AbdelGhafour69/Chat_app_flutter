import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/ConversationLogic.dart';
import 'package:messages/Logic/Message.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/ChatPage/MessageContainer.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ChatMechanism extends StatefulWidget {
  final String id;
  final User other;

  ChatMechanism(this.id, this.other);

  @override
  _ChatMechanismState createState() => _ChatMechanismState();
}

class _ChatMechanismState extends State<ChatMechanism> {
  final TextEditingController messageController = TextEditingController();

  final ScrollController scrollController = ScrollController();
  String userid;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(milliseconds: 200),
      () => scrollController
          .jumpTo(scrollController.position.maxScrollExtent + 100),
    );
    final sawsan = Provider.of<UserProvider>(context);
    userid = sawsan.user.user.uid;
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 20, left: 10, right: 10),
            child: StreamBuilder(
              stream: Firestore.instance
                  .collection("User")
                  .document(sawsan.user.user.uid)
                  .collection("Conversations")
                  .document(widget.id)
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
        ),
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  controller: messageController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Enter a Message...",
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
              Container(
                width: 50,
                child: Transform.rotate(
                  angle: -math.pi / 2,
                  child: FlatButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    child: Icon(
                      Icons.send,
                      color: buttoncolor,
                    ),
                    onPressed: () {
                      callback();
                    },
                  ),
                ),
              ),
              // IconButton(
              //   icon: Icon(Icons.arrow_downward,color: greeny,),
              //   iconSize: 20,
              //   onPressed: (){
              //     scrollController.jumpTo(scrollController.position.maxScrollExtent + 50);
              //   },
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> callback() async {
    if (messageController.text.length > 0) {
      addmessage(widget.id, widget.other.id, userid, messageController.text);
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 100,
        curve: Curves.bounceInOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }
}
