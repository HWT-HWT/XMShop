import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../services/KeepAliveWrapper.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/ityingFont.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -ScreenAdapter.heigth(121),
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                controller: controller.scrollController,
                children: [
                  Column(
                    children: [
                      Container(
                        color: Colors.red,
                        width: ScreenAdapter.width(1080),
                        height: ScreenAdapter.heigth(682),
                        child: Image.network(
                          'https://www.itying.com/images/focus/focus02.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: ScreenAdapter.width(20)),
                      Container(
                        color: Colors.red,
                        width: ScreenAdapter.width(1080),
                        height: ScreenAdapter.heigth(690),
                      ),
                      Text(
                        '最近上新',
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(36)),
                      ),
                      Container(
                        color: Colors.red,
                        width: ScreenAdapter.width(1080),
                        height: ScreenAdapter.heigth(690),
                      ),
                      Container(
                        color: Colors.red,
                        width: ScreenAdapter.width(1080),
                        height: ScreenAdapter.heigth(690),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => AppBar(
                  title: AnimatedContainer(
                    width: controller.flage.value
                        ? ScreenAdapter.width(800)
                        : ScreenAdapter.width(620),
                    height: ScreenAdapter.heigth(95),
                    duration: Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(237, 252, 243, 237),
                      borderRadius: BorderRadius.circular(
                        ScreenAdapter.width(50),
                      ),
                    ),

                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                            ScreenAdapter.width(34),
                            0,
                            ScreenAdapter.width(10),
                            0,
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey,
                            size: ScreenAdapter.fontSize(60),
                          ),
                        ),
                        Text(
                          '手机',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: ScreenAdapter.fontSize(38),
                          ),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  backgroundColor: controller.flage.value
                      ? Colors.white
                      : Colors.transparent,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  leading: controller.flage.value
                      ? null
                      : Icon(ItyingIcon.xiaomi),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: controller.flage.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.message,
                        color: controller.flage.value
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
