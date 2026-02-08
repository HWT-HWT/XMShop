import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_controller.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/searchService.dart';

class SearchView extends GetView<SearchControllers> {
  const SearchView({super.key});

  // 历史搜索
  Widget buildSearchBar() {
    return controller.historyList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: ScreenAdapter.heigth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '搜索历史',
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(45),
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.bottomSheet(Container(
                              padding: EdgeInsets.all(ScreenAdapter.width(20)),
                              width: ScreenAdapter.width(1080),
                              height: ScreenAdapter.heigth(360),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(ScreenAdapter.width(40)),
                                  topRight:
                                      Radius.circular(ScreenAdapter.width(40)),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '确定要清空历史记录吗？',
                                        style: TextStyle(
                                            fontSize:
                                                ScreenAdapter.fontSize(40)),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: ScreenAdapter.fontSize(40),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              Colors.grey[300],
                                            ),
                                            foregroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.white),
                                          ),
                                          child: Text('取消')),
                                      ElevatedButton(
                                          onPressed: () {
                                            controller.clearHistoryData();
                                            Get.back();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStateProperty.all(
                                              Colors.grey[300],
                                            ),
                                            foregroundColor:
                                                WidgetStateProperty.all(
                                                    Colors.red),
                                          ),
                                          child: Text('确认')),
                                    ],
                                  )
                                ],
                              )));
                        },
                        icon: Icon(
                          Icons.delete,
                          size: ScreenAdapter.fontSize(60),
                        ))
                  ],
                ),
              ),
              Obx(() {
                return Wrap(
                    // alignment: WrapAlignment.start,
                    children: controller.historyList
                        .map(
                          (value) => GestureDetector(
                            onLongPress: (){
                              Get.defaultDialog(
                                title: '提示信息',
                                middleText: '确定要删除该条历史记录吗？',
                                confirm: ElevatedButton(onPressed: (){
                                  controller.removeHistoryData(value);
                                  Get.back();
                                }, child: Text('确定')),
                                cancel: ElevatedButton(onPressed: (){
                                  Get.back();
                                }, child: Text('取消')),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(
                                  ScreenAdapter.width(32),
                                  ScreenAdapter.heigth(16),
                                  ScreenAdapter.width(32),
                                  ScreenAdapter.heigth(16)),
                              margin: EdgeInsets.all(ScreenAdapter.heigth(16)),
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(value),
                            ),
                          ),
                        )
                        .toList());
              })
            ],
          )
        : Text('暂无历史记录',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenAdapter.fontSize(46)));
  }

  // 猜你喜欢
  Widget buildGuessYouLike() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            ScreenAdapter.heigth(0),
            ScreenAdapter.width(60),
            ScreenAdapter.heigth(0),
            ScreenAdapter.width(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '猜你想搜',
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(45),
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.refresh,
                size: ScreenAdapter.fontSize(60),
              ),
            ],
          ),
        ),
        Wrap(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(32),
                  ScreenAdapter.heigth(16),
                  ScreenAdapter.width(32),
                  ScreenAdapter.heigth(16)),
              margin: EdgeInsets.all(ScreenAdapter.heigth(16)),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Text('苹果'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16),
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16)),
              margin: EdgeInsets.all(ScreenAdapter.heigth(16)),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Text('笔记本'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16),
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16)),
              margin: EdgeInsets.all(ScreenAdapter.heigth(16)),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Text('电脑'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16),
                  ScreenAdapter.width(30),
                  ScreenAdapter.heigth(16)),
              margin: EdgeInsets.all(ScreenAdapter.heigth(16)),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10)),
              child: Text('电脑'),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: ScreenAdapter.width(840),
          height: ScreenAdapter.heigth(95),
          decoration: BoxDecoration(
            color: Color.fromARGB(237, 252, 243, 237),
            borderRadius: BorderRadius.circular(ScreenAdapter.width(50)),
          ),
          child: TextField(
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenAdapter.fontSize(38),
            ),
            autocorrect: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: ScreenAdapter.fontSize(60),
              ),
              border: InputBorder.none,
              hintText: '请输入搜索内容',
              hintStyle: TextStyle(
                color: Colors.black54,
                fontSize: ScreenAdapter.fontSize(38),
              ),
              contentPadding: EdgeInsets.only(
                top: ScreenAdapter.width(0),
              ),
            ),
            onChanged: (value) {
              controller.keywords.value = value;
            },
            onSubmitted: (value) {
              Get.offAndToNamed('/product-list',
                  arguments: {'keywords': value});
              // 保存历史记录
              SearchService.setHistoryData(value);
            },
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                Get.offAndToNamed('/product-list',
                    arguments: {'keywords': controller.keywords.value});

                // 保存历史记录
                SearchService.setHistoryData(controller.keywords.value);
              },
              child: Text(
                '搜索',
                style: TextStyle(
                    fontSize: ScreenAdapter.fontSize(38),
                    color: Colors.black54),
              ))
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(ScreenAdapter.width(40)),
        children: [
          Obx(() => buildSearchBar()),
          buildGuessYouLike(),
          Container(
            margin: EdgeInsets.only(top: ScreenAdapter.heigth(100)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                // 标题
                Container(
                  width: double.infinity,
                  height: ScreenAdapter.heigth(138),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/hot_search.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(ScreenAdapter.width(20)),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: ScreenAdapter.width(40),
                      mainAxisSpacing: ScreenAdapter.heigth(20),
                      childAspectRatio: 3 / 1,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Container(
                            width: ScreenAdapter.width(120),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(ScreenAdapter.width(10)),
                            child: Image.network(
                              'https://ts3.tc.mm.bing.net/th/id/OIP-C.zmk7qqpmIRU_YkrxuixAegAAAA?rs=1&pid=ImgDetMain&o=7&rm=3',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(ScreenAdapter.width(20)),
                              alignment: Alignment.centerLeft,
                              child: Text('小米热水'),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
