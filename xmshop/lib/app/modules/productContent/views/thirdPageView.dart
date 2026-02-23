import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../services/screebAdapter.dart';

class Thirdpageview extends GetView<ProductContentController> {
  const Thirdpageview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk3,
      alignment: Alignment.center,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.heigth(5200),
      color: Colors.yellow,
      child: Text(
        '推荐123',
        style: TextStyle(fontSize: 100),
      ),
    );
  }
}
