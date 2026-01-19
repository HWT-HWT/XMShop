import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/KeepAliveWrapper.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/ityingFont.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  // 顶部导航
  Widget _appBar() {
    return Positioned(
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
              borderRadius: BorderRadius.circular(ScreenAdapter.width(50)),
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
          leading: controller.flage.value ? null : Icon(ItyingIcon.xiaomi),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.qr_code,
                color: controller.flage.value ? Colors.black : Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.message,
                color: controller.flage.value ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _focus() {
    return Container(
      color: Colors.red,
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.heigth(682),
      child: Obx(
        () => Swiper(
          itemCount: controller.swiperList.length,
          itemBuilder: (context, index) {
            String picUrl =
                'https://miapp.itying.com/${controller.swiperList[index].pic}';

            print('Loading image: $picUrl');
            return Image.network(
              picUrl.replaceAll('\\', '/'),
              fit: BoxFit.cover,
            );
          },
          pagination: const SwiperPagination(builder: SwiperPagination.rect),
          autoplay: true,
          loop: true,
        ),
      ),
    );
  }

  // 内容区域
  Widget _homePage() {
    return Positioned(
      top: -ScreenAdapter.heigth(121),
      left: 0,
      right: 0,
      bottom: 0,
      child: ListView(
        controller: controller.scrollController,
        children: [
          Column(
            children: [
              _focus(),
              SizedBox(
                width: ScreenAdapter.width(1080),
                height: ScreenAdapter.width(92),
                child: Image.asset(
                  'assets/images/xiaomiBanner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeepAliveWrapper(
      child: Scaffold(body: Stack(children: [_homePage(), _appBar()])),
    );
  }
}
