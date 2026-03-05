import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xmshop/app/services/screebAdapter.dart';

class TextInput extends StatelessWidget {
  final String hintText;
  final TextEditingController phoneController;
  const TextInput(this.hintText, this.phoneController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenAdapter.width(1000),
      height: ScreenAdapter.heigth(150),
      margin: EdgeInsets.only(
        top: ScreenAdapter.width(30),
        bottom: ScreenAdapter.width(30),
      ),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(
          ScreenAdapter.width(20),
        ),
      ),
      child: TextField(
        obscureText: hintText == '输入密码' ? true : false,
        controller: phoneController,
        inputFormatters: [
          hintText == '输入密码'
              ? FilteringTextInputFormatter.allow(RegExp(r'[0-9a-zA-Z]'))
              : FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType:
            hintText == '输入密码' ? TextInputType.multiline : TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black26,
          ),
          contentPadding: EdgeInsets.only(
            left: ScreenAdapter.width(30),
            right: ScreenAdapter.width(30),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
