import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/Conversation.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/Navigation/NAvigation.dart';
import 'package:messages/View/Style.dart';
import 'package:provider/provider.dart';

class Conversationcard extends StatefulWidget {
  final Conversation convo;
  Conversationcard(this.convo);

  @override
  _ConversationcardState createState() => _ConversationcardState(convo);
}

class _ConversationcardState extends State<Conversationcard> {
  Conversation convo;
  _ConversationcardState(this.convo);
  bool loading;
  User other;
  @override
  void initState() {
    super.initState();
    loading = true;
    getother();
  }

  List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  String gettext(Timestamp cv) {
    if (cv.toDate().weekday == Timestamp.now().toDate().weekday) {
      return cv.toDate().hour.toString() + ":" + cv.toDate().minute.toString();
    } else {
      return days[cv.toDate().weekday - 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    final userinfo = Provider.of<UserProvider>(context);
    return loading
        ? ListTile()
        : StreamBuilder(
            stream: Firestore.instance
                .collection("User")
                .document(userinfo.user.user.uid)
                .collection("Conversations")
                .document(convo.id)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null) return ListTile();
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () {
                      gotochatpage(context, convo.id, other);
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("lib/assets/ll.jpg"),
                    ),
                    title: Text(
                      other.name,
                      style: other.status ? tilenameon : tilenameoff,
                    ),
                    subtitle: Text(
                      snapshot.data["lastmessage"],
                      overflow: TextOverflow.ellipsis,
                      style: lastmessage,
                    ),
                    trailing: Text(
                      gettext(snapshot.data["lastmodified"]),
                    ),
                  ),
                  Container(
                    height: 2,
                    margin: EdgeInsets.only(left: 30, right: 30),
                    color: greeny,
                  )
                ],
              );
            },
          );
  }

  getother() async {
    await Firestore.instance
        .collection("User")
        .document(convo.other.trim())
        .get()
        .then((DocumentSnapshot doc) {
      setState(() {
        other = User.fromfirestore(doc.data);
        other.id = doc.documentID;
        loading = false;
      });
    });
  }
}
