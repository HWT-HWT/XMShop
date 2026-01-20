import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../../models/focus_model.dart';
import '../../../models/category_model.dart';

class HomeController extends GetxController {
  // 浮动导航开关
  RxBool flage = false.obs;

  // 获取页面滚动数据
  final ScrollController scrollController = ScrollController();

  // 轮播图数据
  RxList swiperList = [].obs;

  // 分类数据
  RxList CategoryList = [].obs;

  @override
  void onInit() {
    super.onInit();
    // 获取分类数据
    getCategoryData();
    // 获取轮播图数据
    getFocuData();
    // 监听滚动
    scrollControllerListener();
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
    var response = await Dio().get('https://miapp.itying.com/api/focus');

    var focus = FocusModel.fromJson(response.data);

    swiperList.value = focus.result!;
    // print(swiperList);
    update();
  }

  // 获取分类数据
  void getCategoryData() async {
    var response = await Dio().get('https://miapp.itying.com/api/bestCate');
    var category = CategoryModel.fromJson(response.data);

    CategoryList.value = category.result!;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
