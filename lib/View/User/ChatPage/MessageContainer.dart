import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/Message.dart';
import 'package:messages/View/Style.dart';

class MessageContainer extends StatelessWidget {
  Message msg;

  MessageContainer(this.msg);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: msg.from ? Alignment.bottomRight : Alignment.bottomLeft,
        child: msg.from ? Sent(msg) : Recieved(msg));
  }
}

class Sent extends StatelessWidget {
  final Message msg;
  Sent(this.msg);
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String gettext() {
    if (msg.sent.toDate().weekday == Timestamp.now().toDate().weekday) {
      return msg.sent.toDate().hour.toString() +
          ":" +
          msg.sent.toDate().minute.toString();
    } else {
      return days[msg.sent.toDate().weekday-1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
            width: 200,
            decoration: BoxDecoration(
                color: bluewy,
                borderRadius: BorderRadiusDirectional.circular(10)),
            child: Text(
              msg.message,
              style: mymessage,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right:15,top:5),
            child: Text(
              gettext(),
            ),
          )
        ],
      ),
    );
  }
}

class Recieved extends StatelessWidget {
  final Message msg;
  Recieved(this.msg);
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String gettext() {
    if (msg.sent.toDate().weekday == Timestamp.now().toDate().weekday) {
      return msg.sent.toDate().hour.toString() +
          ":" +
          msg.sent.toDate().minute.toString();
    } else {
      return days[msg.sent.toDate().weekday-1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom:5,left: 20),
                padding:EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                child: Text(
                  msg.message,
                  style: hismessage,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left:20),
                child: Text(
                  gettext(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
