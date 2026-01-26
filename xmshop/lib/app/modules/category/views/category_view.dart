import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:xmshop/app/services/httpsClient.dart';
import '../controllers/category_controller.dart';
import '../../../services/screebAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  Widget _leftCategory() {
    return Container(
      color: Colors.white,
      width: ScreenAdapter.width(280),
      height: double.infinity,
      child: Obx(
        () => ListView.builder(
          itemCount: controller.leftCategoryList.length,
          itemBuilder: ((context, index) {
            return SizedBox(
              width: double.infinity,
              height: ScreenAdapter.heigth(180),
              child: Obx(
                () => InkWell(
                  onTap: () {
                    controller.changeIndex(
                      index,
                      controller.leftCategoryList[index].sId,
                    );
                  },
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: ScreenAdapter.width(8),
                          height: ScreenAdapter.heigth(46),
                          color: controller.selectIndex == index
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                      Center(
                        child: Text(
                          '${controller.leftCategoryList[index].title}',
                          style: TextStyle(
                            fontSize: ScreenAdapter.fontSize(35),
                            fontWeight: controller.selectIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _rightCategory() {
    return Expanded(
      child: Container(
        height: double.infinity,
        color: Colors.white,
        child: Obx(
          () => GridView.builder(
            itemCount: controller.rightCategoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: ScreenAdapter.width(40),
              mainAxisSpacing: ScreenAdapter.width(20),
              childAspectRatio: 240 / 340,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => {
                  Get.toNamed(
                    '/product-list',
                    arguments: {'cid': controller.rightCategoryList[index].sId},
                  ),
                },
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Image.network(
                        HttpsClient.replaeUrl(
                          controller.rightCategoryList[index].pic,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(ScreenAdapter.width(10)),
                      child: Text(
                        '${controller.rightCategoryList[index].title}',
                        style: TextStyle(fontSize: ScreenAdapter.fontSize(34)),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message, color: Colors.black),
          ),
        ],
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.heigth(95),
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
      ),
      body: Row(children: [_leftCategory(), _rightCategory()]),
    );
  }
}
