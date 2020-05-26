import 'package:flutter/material.dart';
import 'package:messages/Logic/AddConversations.dart';
import 'package:messages/Logic/Provider/AddConversation.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/View/Style.dart';
import 'package:messages/View/User/WelcomePage/Conversationlist.dart';
import 'package:provider/provider.dart';
import 'package:messages/Logic/LoginSignup.dart';

class WelcomePAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: <Widget>[
            MyAppbar(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your ID is : "),
                SelectableText(user.user.user.uid),
              ],
            )
          ],
        ),
      ),
      body: Conversations(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: FloatingActionButton.extended(
          backgroundColor: greeny,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<ConversationError>.value(
                        value: ConversationError(),
                      ),
                      ChangeNotifierProvider<UserProvider>.value(
                        value: user,
                      )
                    ],
                    child: Dialog(),
                  );
                });
          },
          label: Text('Start New Conversation'),
        ),
      ),
    );
  }
}

class Dialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<Dialog> {
  GlobalKey<FormState> key = new GlobalKey<FormState>();
  String email;
  @override
  Widget build(BuildContext context) {
    final sawsan = Provider.of<UserProvider>(context);
    final error = Provider.of<ConversationError>(context);
    return AlertDialog(
      content: Container(
        width: 300,
        height: 200,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Text(
              "Add a conversation?",
              style: hismessage,
            ),
            Container(
              height: 30,
              child: Center(
                child: Text(
                  error.message,
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Form(
              key: key,
              child: Container(
                height: 50,
                child: TextFormField(
                  validator: (input) {
                    if (input.isEmpty) return "Enter an email adress";
                  },
                  onSaved: (input) => email = input.trim(),
                  decoration: new InputDecoration(
                    focusColor: greeny,
                    hoverColor: greeny,
                    labelText: "User ID",
                    fillColor: Colors.black,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15.0),
                      borderSide: new BorderSide(color: greeny),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: hismessage,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              color: greeny,
              onPressed: () {
                key.currentState.save();
                startConversation(email, context);
              },
              child: Text(
                "Submit",
                style: title,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: Align(
        child: Text(
          "Welcome",
          style: titleblack,
        ),
        alignment: Alignment.centerLeft,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () {
          signout(context);
        },
      ),
    );
  }
}
