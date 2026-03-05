import 'package:flutter/material.dart';
import '../services/screebAdapter.dart';

class Usercheckbox extends StatelessWidget {
  final bool isChecked;
  final void Function() selectCheckbox;

  const Usercheckbox(this.isChecked, this.selectCheckbox, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenAdapter.width(1000),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              selectCheckbox();
            },
            child: isChecked
                ? Container(
                    margin: EdgeInsets.only(top: ScreenAdapter.width(4)),
                    width: ScreenAdapter.width(50),
                    height: ScreenAdapter.width(50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.width(25)),
                      border: Border.all(
                          color: Colors.black38, width: ScreenAdapter.width(5)),
                    ),
                  )
                : Container(
                    margin: EdgeInsets.only(top: ScreenAdapter.width(4)),
                    padding: EdgeInsets.all(ScreenAdapter.width(2)),
                    width: ScreenAdapter.width(50),
                    height: ScreenAdapter.width(50),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ScreenAdapter.width(25)),
                      border: Border.all(
                          color: Colors.black38, width: ScreenAdapter.width(5)),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
          ),
          Expanded(
            flex: 1,
            child: RichText(
              text: TextSpan(
                text: '已阅读并同意',
                style: TextStyle(color: Colors.black38),
                children: [
                  TextSpan(
                    text: '《小米商城协议》 《小米商城隐私政策》 《小米账号用户协议》 《小米账号隐私政策》',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ],
              ),
              softWrap: true,
              maxLines: null,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
