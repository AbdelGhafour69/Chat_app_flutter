import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/Navigation/NAvigation.dart';
import 'package:provider/provider.dart';

Future<void> login(String email, String password, BuildContext context) async {
  final error = Provider.of<SignIn>(context, listen: false);
  error.setwaiting(true);
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then(
    (value) {
      getuserFirestore(value.user.uid, context, value.user);
    },
  ).catchError((e) {
    print(e);
    error.setwaiting(false);
    error.setMessage("email or password incorrect");
  });
}

Future<void> signup(
    String email, String password, BuildContext context, String name) async {
  final error = Provider.of<SignUp>(context, listen: false);
  error.setwaiting(true);
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then(
    (value) {
      final sawsan = Provider.of<UserProvider>(context, listen: false);
      createdocument(value.user.uid, name);
      User user = User(value.user);
      user.name = name;
      sawsan.user = user;
      error.setwaiting(false);
      gotowelcomepage(context);
    },
  ).catchError(
    (e) {
      print(e);
      error.setwaiting(false);
      error.setMessage("email invalid or already in use");
    },
  );
}

Future<void> createdocument(String uid, String name) async {
  await Firestore.instance.collection("User").document(uid).setData(
    {'fullname': name, 'status': false, 'photourl': ""},
  );
}

Future<void> getuserFirestore(
    String uid, BuildContext context, FirebaseUser fbuser) async {
  await Firestore.instance
      .collection("User")
      .document(uid)
      .get()
      .then((DocumentSnapshot doc) {
    final sawsan = Provider.of<UserProvider>(context, listen: false);

    User usr = User.fromJson(doc.data, fbuser);
    usr.status = true;
    sawsan.setuser(usr);
    setstatus(usr);
    final error = Provider.of<SignIn>(context, listen: false);
    error.setwaiting(false);
    gotowelcomepage(context);
  });
}

Future<void> setstatus(User user) async {
  await Firestore.instance
      .collection("User")
      .document(user.user.uid)
      .setData(user.toJson());
}

Future<void> signout(BuildContext context) async {
  final user = Provider.of<UserProvider>(context, listen: false);
  user.user.status = false;
  FirebaseAuth.instance.signOut().then((value) => setstatus(user.user));
  backtologinpage(context);
}
