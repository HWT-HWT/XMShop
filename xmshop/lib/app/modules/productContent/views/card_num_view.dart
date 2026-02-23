import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import 'package:xmshop/app/services/screebAdapter.dart';

class CardNumView extends GetView<ProductContentController> {
  const CardNumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
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
                controller.decBuyNum();
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
              child: Text("${controller.buyNum}"),
            ),
            InkWell(
              onTap: () {
                controller.incBuyNum();
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
      ),
    );
  }
}
