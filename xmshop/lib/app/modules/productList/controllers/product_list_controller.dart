import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../models/plist_model.dart';
import '../../../services/httpsClient.dart';

class ProductListController extends GetxController {
  ScrollController scrollController = ScrollController();

  RxInt page = 1.obs;
  RxInt pageSize = 8.obs;
  RxList plist = [].obs;
  bool flag = true;
  RxBool hasData = true.obs;
  GlobalKey<ScaffoldState> ScaffoldglobalKey = GlobalKey<ScaffoldState>();

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    initScrollContorller();
    getPlistData();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void initScrollContorller() {
    scrollController.addListener(() {
      // scrollController.position.pixels  滚动条下拉的高度
      // scrollController.position.maxScrollExtent  页面高度
      if (scrollController.position.pixels >
          scrollController.position.maxScrollExtent - 30) {
        if (flag) {
          getPlistData();
        }
      }
    });
  }

  // 获取商品列表数据
  void getPlistData() async {
    if (hasData.value) {
      flag = false;
      var response = await httpsClient.get(
        'api/plist?cid=${Get.arguments['cid']}&page=$page&pageSize=$pageSize',
      );

      if (response != null) {
        var plistTemp = PlistModel.fromJson(response.data!);
        plist.addAll(plistTemp.result!);
        page++;
        flag = true;
        if (plistTemp.result!.length < pageSize.value) {
          hasData.value = false;
        }
        update();
      }
    }
  }
}
