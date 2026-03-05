// logo
import 'package:flutter/material.dart';
import '../services/screebAdapter.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return // logo
        Center(
      child: Container(
        margin: EdgeInsets.only(
          bottom: ScreenAdapter.width(100),
        ),
        width: ScreenAdapter.width(200),
        height: ScreenAdapter.width(200),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
