import 'package:flutter/material.dart';
import 'package:messages/Logic/Provider/SignInUP.dart';
import 'package:messages/Logic/Provider/UserProvide.dart';
import 'package:messages/Logic/User.dart';
import 'package:messages/View/User/ChatPage/ChatPage.dart';
import 'package:messages/View/User/ChatPage/UIChat.dart';
import 'package:messages/View/User/RegistrationScreen/RegistrationScreen.dart';
import 'package:messages/View/User/WelcomePage/WelcomePage.dart';
import 'package:provider/provider.dart';

gotoRegistration(BuildContext context) {
  final sawsan = Provider.of<UserProvider>(context, listen: false);
  Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<SignUp>.value(
            value: SignUp(),
          ),
          ChangeNotifierProvider<UserProvider>.value(
            value: sawsan,
          ),
        ],
        child: new RegistratioScreen(),
      ),
    ),
  );
}

gotowelcomepage(BuildContext context) {
  final sawsan = Provider.of<UserProvider>(context, listen: false);
  Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider<UserProvider>.value(
        value: sawsan,
        child: WelcomePAge(),
      ),
    ),
  );
}

backtologinpage(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

gotochatpage(BuildContext context,String conversationID,User other) {
  final sawsan = Provider.of<UserProvider>(context,listen: false);
  Navigator.push(
    context,
    new MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider<UserProvider>.value(
        child: ChatUI(conversationID,other),
        value: sawsan,
      ),
    ),
  );
}
