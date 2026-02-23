import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../services/screebAdapter.dart';

class Secondpageview extends GetView<ProductContentController> {
  final Function subHeader;
  const Secondpageview(this.subHeader, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: controller.gk2,
      width: ScreenAdapter.width(1080),
      color: Colors.white,
      child: Column(
        children: [
          subHeader(),
          Obx(
            () => controller.selectSubTabsIndex.value == 1
                ? SizedBox(
                    child: Html(
                      data:
                          controller.pcontent.value.content ?? '<p>加载中...</p>',
                      style: {'body': Style(backgroundColor: Colors.white)},
                    ),
                  )
                : SizedBox(
                    child: Html(
                      data: controller.pcontent.value.specs,
                      style: {'body': Style(backgroundColor: Colors.white)},
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
