import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../services/KeepAliveWrapper.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/ityingFont.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../services/httpsClient.dart';

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
          title: InkWell(
            child: AnimatedContainer(
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
          onTap: () {
            Get.toNamed('/search');
           },
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

  // 轮播图
  Widget _focus() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.heigth(682),
      child: Obx(
        () => Swiper(
          itemCount: controller.swiperList.length,
          itemBuilder: (context, index) {
            return Image.network(
              HttpsClient.replaeUrl(controller.swiperList[index].pic),
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

  // 横幅广告
  Widget _banner() {
    return SizedBox(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.width(92),
      child: Image.asset('assets/images/xiaomiBanner.png', fit: BoxFit.cover),
    );
  }

  // 顶部滑动分类
  Widget _category() {
    return Container(
      width: ScreenAdapter.width(1080),
      height: ScreenAdapter.heigth(470),
      color: Colors.white,
      child: Obx(
        () => Swiper(
          itemBuilder: (context, index) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (BuildContext context, int i) {
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: ScreenAdapter.heigth(140),
                      height: ScreenAdapter.heigth(140),
                      child: Image.network(
                        HttpsClient.replaeUrl(
                          controller.categoryList[index * 10 + i].pic,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenAdapter.heigth(5)),
                      child: Text(
                        '${controller.categoryList[index * 10 + i].title}',
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(30)),
                      ),
                    ),
                  ],
                );
              },
            );
          },
          pagination: SwiperPagination(
            margin: const EdgeInsets.all(0.0),
            builder: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig config) {
                return ConstrainedBox(
                  constraints: BoxConstraints.expand(
                    height: ScreenAdapter.heigth(40),
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: const RectSwiperPaginationBuilder(
                            color: Colors.black12,
                            activeColor: Colors.black54,
                          ).build(context, config),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          itemCount: controller.categoryList.length ~/ 10,
        ),
      ),
    );
  }

  // 第二个横幅广告
  Widget _banner2() {
    return Padding(
      padding: EdgeInsetsGeometry.all(ScreenAdapter.width(20)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenAdapter.width(20)),
          image: DecorationImage(
            image: AssetImage('assets/images/xiaomiBanner2.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: ScreenAdapter.heigth(430),
      ),
    );
  }

  // 热销臻选
  Widget bestSelling() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.heigth(20),
            ScreenAdapter.width(30),
            ScreenAdapter.heigth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '热销臻选',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(50),
                ),
              ),
              Text(
                '更多手机推荐 >',
                style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsGeometry.all(ScreenAdapter.width(30)),
          child: Row(
            children: [
              // 左侧轮播图
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.heigth(740),
                  child: Obx(
                    () => Swiper(
                      itemCount: controller.positionList.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          HttpsClient.replaeUrl(
                            controller.positionList[index].pic,
                          ),
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: SwiperPagination(
                        margin: const EdgeInsets.all(0.0),
                        builder: SwiperCustomPagination(
                          builder:
                              (
                                BuildContext context,
                                SwiperPluginConfig config,
                              ) {
                                return ConstrainedBox(
                                  constraints: BoxConstraints.expand(
                                    height: ScreenAdapter.heigth(40),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child:
                                              const RectSwiperPaginationBuilder(
                                                color: Colors.black12,
                                                activeColor: Colors.black54,
                                              ).build(context, config),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                        ),
                      ),
                      autoplay: true,
                      loop: true,
                    ),
                  ),
                ),
              ),
              SizedBox(width: ScreenAdapter.width(20)),
              // 右侧三行两列
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: ScreenAdapter.heigth(740),
                  child: Obx(
                    () => Column(
                      children: controller.sellingList.asMap().entries.map((
                        entrie,
                      ) {
                        var value = entrie.value;
                        String picUrl = 'http://miapp.itying.com/${value.pic}';
                        return Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            margin: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              entrie.key == 2 ? 0 : ScreenAdapter.heigth(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.fromLTRB(
                                      ScreenAdapter.width(20),
                                      0,
                                      ScreenAdapter.width(20),
                                      0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${value.title}',
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                              38,
                                            ),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${value.subTitle}',
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                              28,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '￥${value.price}元',
                                          style: TextStyle(
                                            fontSize: ScreenAdapter.fontSize(
                                              28,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsGeometry.all(
                                      ScreenAdapter.width(10),
                                    ),
                                    child: Image.network(
                                      picUrl.replaceAll('\\', '/'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 瀑布流
  Widget _bestGodds() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(
            ScreenAdapter.width(30),
            ScreenAdapter.heigth(20),
            ScreenAdapter.width(30),
            ScreenAdapter.heigth(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '省心优惠',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ScreenAdapter.fontSize(50),
                ),
              ),
              Text(
                '全部优惠 >',
                style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
              ),
            ],
          ),
        ),
        Obx(
          () => Container(
            color: Color.fromRGBO(246, 246, 246, 1),
            padding: EdgeInsets.all(ScreenAdapter.heigth(30)),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: ScreenAdapter.width(25),
              crossAxisSpacing: ScreenAdapter.width(20),
              itemCount: controller.bestLit.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      ScreenAdapter.width(20),
                    ),
                  ),
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(ScreenAdapter.heigth(20)),
                        child: Image.network(
                          HttpsClient.replaeUrl(controller.bestLit[index].pic),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                        child: Text(
                          '${controller.bestLit[index].title}',
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(36),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                        child: Text(
                          '${controller.bestLit[index].subTitle}',
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                        child: Text(
                          '￥${controller.bestLit[index].price}元',
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
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
              _banner(),
              _category(),
              _banner2(),
              bestSelling(),
              _bestGodds(),
              SizedBox(height: ScreenAdapter.heigth(200)),
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
