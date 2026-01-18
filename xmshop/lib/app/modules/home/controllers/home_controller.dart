import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {

  RxBool flage = false.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      
      if (scrollController.position.pixels > 10 &&scrollController.position.pixels <30) {
       if (flage == false) {
          print('scrollController.position.pixels>10<30$flage');
          flage.value = true;
          update();
       }
      } 
      if (scrollController.position.pixels < 10) {
        if (flage == true) {
           print('scrollController.position.pixels<10$flage');
           flage.value = false;
          update();
       }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
