import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';

import '../controllers/product_content_controller.dart';

import '../../../services/screebAdapter.dart';
import '../../../services/httpsClient.dart';
import 'card_num_view.dart';
// 页面
import './firstPageView.dart';
import './secondPageView.dart';
import './thirdPageView.dart';

class ProductContentView extends GetView<ProductContentController> {
  const ProductContentView({super.key});

  void addcard() {
    controller.addCart();
  }

  void buy() {
    controller.setSelectedAtter();
    Get.back();
    print('立即购买');
  }

  // showButtomAttr
  void showButtomAttr(int action) {
    // showButtomAttr 只能使用GetBuilder方式实现双向绑定
    Get.bottomSheet(
      GetBuilder<ProductContentController>(
        init: controller,
        builder: (controller) {
          return Container(
            padding: EdgeInsets.all(ScreenAdapter.width(60)),
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.width(1200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: ListView(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: ScreenAdapter.width(200),
                      height: ScreenAdapter.heigth(300),
                      child: Image.network(
                        HttpsClient.replaeUrl(controller.pcontent.value.pic),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(
                        left: ScreenAdapter.width(80),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '￥${controller.pcontent.value.price}元',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: ScreenAdapter.fontSize(55),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: ScreenAdapter.heigth(10),
                          ),
                          Text(
                            '${controller.selectAttr}',
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(35),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: controller.pcontent.value.attr!.map((v) {
                    return Wrap(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            top: ScreenAdapter.heigth(60),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${v.cate}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: v.attrList!.map((value) {
                                  return InkWell(
                                    onTap: () {
                                      controller.changeAttr(
                                          v.cate, value['title']);
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                          minWidth: ScreenAdapter.width(180)),
                                      decoration: BoxDecoration(
                                        border: BoxBorder.all(
                                          color: value['check']
                                              ? Colors.amber
                                              : Color.fromARGB(
                                                  31, 173, 173, 173),
                                        ),
                                        color: const Color.fromARGB(
                                            31, 173, 173, 173),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(
                                        top: ScreenAdapter.heigth(20),
                                        right: ScreenAdapter.width(40),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                        ScreenAdapter.heigth(20),
                                        ScreenAdapter.heigth(0),
                                        ScreenAdapter.heigth(20),
                                        ScreenAdapter.heigth(0),
                                      ),
                                      height: ScreenAdapter.heigth(
                                        ScreenAdapter.heigth(250),
                                      ),
                                      child: Text(
                                        '${value['title']}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: value['check']
                                              ? Colors.amber
                                              : Colors.black,
                                          fontWeight: FontWeight.normal,
                                          fontSize: ScreenAdapter.fontSize(40),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    top: ScreenAdapter.width(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('数量'), CardNumView()],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsGeometry.only(top: ScreenAdapter.width(70)),
                  child: Row(
                    children: [
                      action == 2 || action == 1
                          ? Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  addcard();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.all(ScreenAdapter.width(20)),
                                  margin: EdgeInsets.only(
                                    right: ScreenAdapter.width(20),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(
                                      ScreenAdapter.width(100),
                                    ),
                                  ),
                                  child: Text(
                                    '加入购物车',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenAdapter.fontSize(42)),
                                  ),
                                ),
                              ))
                          : SizedBox.shrink(),
                      action == 3 || action == 1
                          ? Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  buy();
                                },
                                child: Container(
                                  padding:
                                      EdgeInsets.all(ScreenAdapter.width(20)),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(
                                      ScreenAdapter.width(100),
                                    ),
                                  ),
                                  child: Text(
                                    '立即购买',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ScreenAdapter.fontSize(42)),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _subHeader() {
    return Container(
      alignment: Alignment.center,
      height: ScreenAdapter.heigth(100),
      color: Colors.white,
      child: Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.subTabList.map((v) {
            return Obx(
              () => Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    controller.changeSubTabs(v['id']);
                  },
                  child: Text(
                    '${v['title']}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: controller.selectSubTabsIndex == v['id']
                            ? Colors.red
                            : Colors.black),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Obx(
      () => AppBar(
        // appber样式
        centerTitle: true,
        backgroundColor:
            Colors.white.withValues(alpha: controller.opacity.value),
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: true,
        // 布局
        leading: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: ScreenAdapter.width(88),
            height: ScreenAdapter.width(88),
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                alignment: Alignment.center,
                backgroundColor: WidgetStateProperty.all(Colors.black12),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(CircleBorder()),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: ScreenAdapter.fontSize(45),
              ),
            ),
          ),
        ),
        title: controller.showTabs.value
            ? SizedBox(
                width: ScreenAdapter.width(400),
                height: ScreenAdapter.heigth(200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: controller.tabsList.map((v) {
                    return InkWell(
                      onTap: () {
                        controller.changeSelectedTabsIndex(v['id']);
                        if (v['id'] == 1) {
                          Scrollable.ensureVisible(
                            controller.gk1.currentContext as BuildContext,
                            duration: Duration(milliseconds: 100),
                          );
                        } else if (v['id'] == 2) {
                          Scrollable.ensureVisible(
                            controller.gk2.currentContext as BuildContext,
                            duration: Duration(milliseconds: 100),
                          );
                          Timer.periodic(Duration(milliseconds: 101), (timer) {
                            controller.scrollController.jumpTo(
                                controller.scrollController.position.pixels -
                                    ScreenAdapter.heigth(120));
                            timer.cancel();
                          });
                        } else if (v['id'] == 3) {
                          // 锚点定位
                          Scrollable.ensureVisible(
                            // 跳转地址
                            controller.gk3.currentContext as BuildContext,
                            // 设置时间
                            duration: Duration(milliseconds: 100),
                          );
                          Timer.periodic(Duration(milliseconds: 101), (timer) {
                            controller.scrollController.jumpTo(
                                controller.scrollController.position.pixels -
                                    ScreenAdapter.heigth(120));
                            timer.cancel();
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${v['title']}',
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(40),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          v['id'] == controller.selectTabsIndex.value
                              ? Container(
                                  margin: EdgeInsets.only(
                                    top: ScreenAdapter.heigth(10),
                                  ),
                                  width: ScreenAdapter.width(100),
                                  height: ScreenAdapter.heigth(4),
                                  color: Colors.red,
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              )
            : SizedBox.shrink(),
        actions: [
          Container(
            padding: EdgeInsets.only(right: ScreenAdapter.width(30)),
            alignment: Alignment.center,
            child: SizedBox(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  alignment: Alignment.center,
                  backgroundColor: WidgetStatePropertyAll(Colors.black12),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Icon(Icons.file_upload_outlined),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: ScreenAdapter.width(30)),
            child: SizedBox(
              width: ScreenAdapter.width(88),
              height: ScreenAdapter.width(88),
              child: ElevatedButton(
                onPressed: () {
                  showMenu(
                    color: Colors.black87.withValues(alpha: 0.7),
                    context: context,
                    position: RelativeRect.fromLTRB(ScreenAdapter.width(800),
                        ScreenAdapter.heigth(220), ScreenAdapter.width(20), 0),
                    items: [
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            Text(
                              '首页',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.white,
                            ),
                            Text(
                              '消息',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                            Text(
                              '收藏',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  backgroundColor: WidgetStatePropertyAll(Colors.black12),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Icon(Icons.more_horiz_rounded),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: [
          Firstpageview(showButtomAttr),
          Secondpageview(_subHeader),
          Thirdpageview(),
        ],
      ),
    );
  }

  Widget _bottom() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: ScreenAdapter.heigth(180),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: ScreenAdapter.width(120),
              height: ScreenAdapter.heigth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  Text(
                    '客服',
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(120),
              height: ScreenAdapter.heigth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  Text(
                    '客服',
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: ScreenAdapter.width(120),
              height: ScreenAdapter.heigth(180),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart),
                  Text(
                    '客服',
                    style: TextStyle(
                      fontSize: ScreenAdapter.fontSize(32),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: ScreenAdapter.heigth(180),
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(right: -10),
                    child: ElevatedButton(
                        onPressed: () {
                          showButtomAttr(2);
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.orange),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          '加入购物车',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Container(
                    height: ScreenAdapter.heigth(180),
                    alignment: Alignment.center,
                    child: ElevatedButton(
                        onPressed: () {
                          showButtomAttr(3);
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.red),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          '立即购买',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenAdapter.heigth(100)),
        child: _appBar(context),
      ),
      body: Stack(
        children: [
          _body(),
          _bottom(),
          Obx(
            () => controller.showSubHeaderTabs.value
                ? Positioned(
                    top: ScreenAdapter.getStaticScreenHeigth() +
                        ScreenAdapter.heigth(100),
                    left: 0,
                    right: 0,
                    child: _subHeader(),
                  )
                : SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
