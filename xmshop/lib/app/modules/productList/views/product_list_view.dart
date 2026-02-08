import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_list_controller.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/httpsClient.dart';

class ProductListView extends GetView<ProductListController> {
  const ProductListView({super.key});

  Widget _productListWidget() {
    return Obx(
      () => controller.plist.isNotEmpty
          ? ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.plist.length,
              padding: EdgeInsets.fromLTRB(
                ScreenAdapter.heigth(25),
                ScreenAdapter.heigth(150),
                ScreenAdapter.heigth(25),
                ScreenAdapter.heigth(80),
              ),
              itemBuilder: (cotext, index) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: ScreenAdapter.heigth(25)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          ScreenAdapter.width(40),
                        ),
                      ),
                      child: Row(
                        children: [
                          // 左侧
                          Container(
                            width: ScreenAdapter.width(400),
                            height: ScreenAdapter.heigth(460),
                            padding: EdgeInsets.all(ScreenAdapter.width(60)),
                            child: Image.network(
                              HttpsClient.replaeUrl(
                                '${controller.plist[index].sPic}',
                              ),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          // 右侧
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsGeometry.only(
                                right: ScreenAdapter.width(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(
                                      bottom: ScreenAdapter.heigth(20),
                                    ),
                                    child: Text(
                                      '${controller.plist[index].title}',
                                      style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(42),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsGeometry.only(
                                      bottom: ScreenAdapter.heigth(20),
                                    ),
                                    child: Text(
                                      '${controller.plist[index].subTitle}',
                                      style: TextStyle(
                                        fontSize: ScreenAdapter.fontSize(34),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      bottom: ScreenAdapter.heigth(20),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'CPU',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Hello G25',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'CPU',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Hello G25',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                'CPU',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                'Hello G25',
                                                style: TextStyle(
                                                  fontSize:
                                                      ScreenAdapter.fontSize(
                                                    34,
                                                  ),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '￥${controller.plist[index].price}起',
                                    style: TextStyle(
                                      fontSize: ScreenAdapter.fontSize(38),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    index == controller.plist.length - 1
                        ? _productIndicator()
                        : SizedBox(),
                  ],
                );
              },
            )
          : _productIndicator(),
    );
  }

  Widget subHeaderWidget() {
    return Positioned(
        left: 0,
        top: 0,
        right: 0,
        child: Obx(
          () => Container(
            width: ScreenAdapter.width(1080),
            height: ScreenAdapter.heigth(120),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: ScreenAdapter.heigth(2),
                  color: Color.fromRGBO(233, 233, 233, 0.9),
                ),
              ),
            ),
            child: Row(
              children: controller.subHeaderList.map((index) {
                return Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: EdgeInsetsGeometry.fromLTRB(
                            0,
                            ScreenAdapter.heigth(15),
                            0,
                            ScreenAdapter.heigth(15),
                          ),
                          child: Text(
                            '${index['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: ScreenAdapter.fontSize(38),
                              color: controller.selectHeaderId == index['id']
                                  ? Colors.red
                                  : Colors.black45,
                            ),
                          ),
                        ),
                        onTap: () {
                          controller.setSelectHeaderId(index['id']);
                        },
                      ),
                      _showIcon(index['id']),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }

  // 自定义箭头组件
  Widget _showIcon(int id) {
    if (id == 2 ||
        id == 3 ||
        controller.subHeaderListIdSort.value == 1 ||
        controller.subHeaderListIdSort.value == -1) {
      if (controller.subHeaderList[id - 1]['sort'] == -1) {
        return Icon(Icons.arrow_drop_down, size: ScreenAdapter.fontSize(50));
      }
      return Icon(Icons.arrow_drop_up, size: ScreenAdapter.fontSize(50));
    } else {
      return Text('');
    }
  }

  // 自定义组件
  Widget _productIndicator() {
    if (controller.hasData.value) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Center(
        child: Text('已经加载全部了', style: TextStyle(color: Colors.black26)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldglobalKey,
      endDrawer: Drawer(child: DrawerHeader(child: Text('右侧筛选'))),
      backgroundColor: Color.fromRGBO(237, 252, 243, 1),
      appBar: AppBar(
        actions: [Text('')],
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: ScreenAdapter.width(910),
          height: ScreenAdapter.heigth(95),
          decoration: BoxDecoration(
            color: Color.fromRGBO(237, 252, 243, 1),
            borderRadius: BorderRadius.circular(ScreenAdapter.width(50)),
          ),
          child: InkWell(
            onTap: () {
              Get.offAndToNamed('/search');
            },
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
                  controller.keywords != null ? '${controller.keywords}' : '',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenAdapter.fontSize(38),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(() => controller.plist.isNotEmpty
          ? Stack(children: [_productListWidget(), subHeaderWidget()])
          :  _productIndicator()),
    );
  }
}
