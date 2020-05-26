import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/View/Style.dart';

class ChatHeader extends StatelessWidget {
  User other;
  ChatHeader(this.other);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage: AssetImage("lib/assets/ll.jpg"),
        ),
        title: Text(other.name),
        subtitle: StreamBuilder(
          stream: Firestore.instance
              .collection("User")
              .document(other.id)
              .snapshots(),
          builder: (_, snapshot) {
            if (snapshot.data == null) return Container();
            if (snapshot.data["status"] == true)
              return Text(
                "Online",
                style: tilenameon,
              );
            return Text(
              "Offline",
              style: tilenameoff,
            );
          },
        ),
        trailing: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
