import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../models/focus_model.dart';
import '../../../models/category_model.dart';
import '../../../models/plist_model.dart';
import '../../../services/httpsClient.dart';

class HomeController extends GetxController {
  // 浮动导航开关
  RxBool flage = false.obs;

  // 获取页面滚动数据
  final ScrollController scrollController = ScrollController();

  // 轮播图数据
  RxList swiperList = [].obs;

  // 分类数据
  RxList categoryList = [].obs;

  // 热销臻选轮播图数据
  RxList positionList = [].obs;

  // 热销臻选数据
  RxList sellingList = [].obs;

  //瀑布流数据
  RxList bestLit = [].obs;

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    // 获取分类数据
    getCategoryData();
    // 获取轮播图数据
    getFocuData();
    // 监听滚动
    scrollControllerListener();
    // 热销臻选轮播图
    focuPosition();
    // 热销臻选数据
    getSellingListData();

    // 获取瀑布流数据
    getBestList();
  }

  // 监听滚动
  void scrollControllerListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels > 10 &&
          scrollController.position.pixels < 30) {
        if (flage == false) {
          // print('scrollController.position.pixels>10<30$flage');
          flage.value = true;
          update();
        }
      }
      if (scrollController.position.pixels < 10) {
        if (flage == true) {
          // print('scrollController.position.pixels<10$flage');
          flage.value = false;
          update();
        }
      }
    });
  }

  // 获取轮播图数据
  void getFocuData() async {
    var response = await httpsClient.get('api/focus');

    if (response != null) {
      var focus = FocusModel.fromJson(response.data);
      swiperList.value = focus.result!;
      // print(swiperList);
      update();
    }
  }

  // 获取分类数据
  void getCategoryData() async {
    var response = await httpsClient.get('api/bestCate');

    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      categoryList.value = category.result!;
      update();
    }
  }

  // 获取热销臻选轮播图
  void focuPosition() async {
    var response = await httpsClient.get('api/focus?position=2');

    if (response != null) {
      var focus = FocusModel.fromJson(response.data);
      positionList.value = focus.result!;
    }
  }

  // 获取热销臻选商品数据
  void getSellingListData() async {
    var response = await httpsClient.get('api/plist?is_hot=1');

    if (response != null) {
      var pList = PlistModel.fromJson(response.data);
      sellingList.value = pList.result!;
    }
  }

  // 获取热销臻选商品数据
  void getBestList() async {
    var response = await httpsClient.get('api/plist?is_best=1');

    if (response != null) {
      var bLit = PlistModel.fromJson(response.data);
      bestLit.value = bLit.result!;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
