import 'package:flutter/material.dart';
import 'package:xmshop/app/services/screebAdapter.dart';

class SubBottom extends StatelessWidget {
  final String text;
  const SubBottom(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: ScreenAdapter.width(50)),
        decoration: BoxDecoration(
            color: Color.fromRGBO(238, 120, 50, 1),
            borderRadius: BorderRadius.circular(ScreenAdapter.width(100))),
        padding: EdgeInsets.all(
          ScreenAdapter.width(30),
        ),
        width: ScreenAdapter.width(1000),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: ScreenAdapter.fontSize(40),
          ),
        ),
      ),
    );
  }
}
