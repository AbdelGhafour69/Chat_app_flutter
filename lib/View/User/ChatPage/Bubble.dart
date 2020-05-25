import 'package:flutter/material.dart';
import 'package:messages/View/Style.dart';

class ChatBuble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(180),
          bottomRight: Radius.circular(180),
        ),
        color: yellowy,
      ),
    );
  }
}
