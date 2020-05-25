import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:messages/Logic/Message.dart';

Future<void> addmessage(
    String convoid, String otherid, String uid, String message) async {
  Message mesg = Message(true, message, Timestamp.now());
  await Firestore.instance
      .collection("User")
      .document(uid)
      .collection("Conversations")
      .document(convoid)
      .collection("messages")
      .add(
        mesg.toJson(),
      )
      .then((_) => setConversation(uid, convoid, mesg, otherid));
  mesg.from = false;
  await Firestore.instance
      .collection("User")
      .document(otherid)
      .collection("Conversations")
      .where("with", isEqualTo: uid)
      .getDocuments()
      .then((QuerySnapshot docs) {
    if (docs.documents.length == 0) {
      startConversation(otherid, uid, mesg);
    } else {
      setConversation(otherid, docs.documents[0].documentID, mesg, uid);
      insertmessage(mesg, docs.documents[0].documentID, otherid);
    }
  });
}

Future<void> setConversation(
    String userid, String conversationid, Message msg, String other) async {
  await Firestore.instance
      .collection("User")
      .document(userid)
      .collection("Conversations")
      .document(conversationid)
      .setData({
    "from": msg.from,
    "lastmessage": msg.message,
    "lastmodified": msg.sent,
    "with": other
  });
}

Future<void> insertmessage(Message msg, String convoid, String userid) async {
  await Firestore.instance
      .collection("User")
      .document(userid)
      .collection("Conversations")
      .document(convoid)
      .collection("messages")
      .add(msg.toJson());
}

Future<void> startConversation(
    String otherid, String userid, Message msg) async {
  await Firestore.instance
      .collection("User")
      .document(otherid)
      .collection("Conversations")
      .add({
    "from": false,
    "lastmessage": msg.message,
    "lastmodified": msg.sent,
    "with": userid
  }).then((DocumentReference doc) {
    insertmessage(msg, doc.documentID, otherid);
  });
}
