import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(title: const Text('TabsView'), centerTitle: true),
        body: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: controller.pages,
          onPageChanged: (index) {
            controller.setCurrentIndex(index);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.red,
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.setCurrentIndex(index);
            controller.pageController.jumpToPage(index);
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: '服务',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: '购物车',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的'),
          ],
        ),
      ),
    );
  }
}
