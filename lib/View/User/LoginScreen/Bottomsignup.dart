import 'package:flutter/material.dart';
import 'package:messages/Navigation/NAvigation.dart';
import 'package:messages/View/Style.dart';

class BottomSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BublesLeft(),
          GestureDetector(
            onTap: (){
              gotoRegistration(context);
            },
            child: Container(
              margin: EdgeInsets.only(right:20),
                child: Text(
              "SignUP",
              style: titleblack,
            )),
          )
        ],
      ),
    );
  }
}

class BublesLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 50),
          height: 120,
          width: 60,
          decoration: BoxDecoration(
            color: greeny,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(120),
              bottomRight: Radius.circular(120),
            ),
            boxShadow: [
              BoxShadow(
                color: yellowy.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(3, -4), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: new BoxDecoration(
            color: greeny,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: yellowy.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(3, -4), // changes position of shadow
              ),
            ],
          ),
        ),
      ],
    );
  }
}
