import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../../../services/screebAdapter.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});
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
      body: Row(
        children: [
          Container(
            color: Colors.white,
            width: ScreenAdapter.width(280),
            height: double.infinity,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return Container(
                  width: double.infinity,
                  height: ScreenAdapter.heigth(140),
                  child: Stack(
                    children: [
                     Align(
                      alignment: Alignment.centerLeft,
                      child:  Container(
                        width: ScreenAdapter.width(8),
                        height: ScreenAdapter.heigth(46),
                        color: Colors.red,
                      ),
                     ),
                      Center(
                        child: Text('第$index')
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Expanded(
            child: Container(height: double.infinity, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
