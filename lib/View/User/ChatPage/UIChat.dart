import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/ConversationLogic.dart';
import 'package:messages/Logic/Message.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/ChatPage/Bubble.dart';
import 'package:messages/View/User/ChatPage/ChatHeader.dart';
import 'package:messages/View/User/ChatPage/ChatMechanism.dart';
import 'package:messages/View/User/ChatPage/MessageContainer.dart';
import 'package:provider/provider.dart';

class ChatUI extends StatelessWidget {
  String id;
  User other;
  ChatUI(this.id, this.other);
  

  @override
  Widget build(BuildContext context) {
    final sawsan = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: chatbackground,
      body: Stack(
        children: <Widget>[
          ChatBuble(),
          ChatHeader(other),
          Container(
            margin: EdgeInsets.only(top: 150),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 20,
                  offset: Offset(3, -4), // changes position of shadow
                ),
              ],
              color: chatbackground,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: ChatMechanism(id,other)
          )
        ],
      ),
    );
  }
}
