import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import 'package:xmshop/app/services/screebAdapter.dart';

class CardNumView extends GetView<CartController> {
  final Map cardItem;
  const CardNumView(this.cardItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ScreenAdapter.width(50),
        ),
        border: BoxBorder.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              controller.decCartNum(cardItem);
            },
            child: Container(
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  right: BorderSide(color: Colors.black12),
                ),
              ),
              padding: EdgeInsets.only(
                left: ScreenAdapter.width(30),
                right: ScreenAdapter.width(30),
              ),
              child: Text('-'),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenAdapter.width(30),
              right: ScreenAdapter.width(30),
            ),
            child: Text('${cardItem['count']}'),
          ),
          InkWell(
            onTap: () {
              controller.incCartNum(cardItem);
            },
            child: Container(
              decoration: BoxDecoration(
                border: BoxBorder.fromLTRB(
                  left: BorderSide(color: Colors.black12),
                ),
              ),
              padding: EdgeInsets.only(
                left: ScreenAdapter.width(30),
                right: ScreenAdapter.width(30),
              ),
              child: Text('+'),
            ),
          )
        ],
      ),
    );
  }
}
