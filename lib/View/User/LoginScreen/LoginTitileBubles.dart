import 'package:flutter/material.dart';
import 'package:messages/View/Style.dart';

class LoginLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:20),
          child: Text(
            "Login",
            style: titleblack,
          ),
        ),
        Bubles()
      ],
    );
  }
}

class Bubles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left:20),
          height: 50,
          width: 50,
          decoration: new BoxDecoration(
            color: yellowy,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: greeny.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(3, -4), // changes position of shadow
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 50),
          height: 120,
          width: 60,
          decoration: BoxDecoration(
            color: yellowy,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(120),
              bottomLeft: Radius.circular(120),
            ),
            boxShadow: [
              BoxShadow(
                color: greeny.withOpacity(0.5),
                spreadRadius: 10,
                blurRadius: 20,
                offset: Offset(3, -4), // changes position of shadow
              ),
            ],
          ),
        )
      ],
    );
  }
}
