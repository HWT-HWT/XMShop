import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xmshop/app/services/screebAdapter.dart';
import '../controllers/cart_controller.dart';
import './card_list_view.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  Widget bottomPositioned() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        width: ScreenAdapter.width(1080),
        height: ScreenAdapter.heigth(200),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Radio(
                  value: false,
                ),
                Text('全选'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '合计 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenAdapter.fontSize(38),
                          ),
                        ),
                        Text(
                          '(不含运费):',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: ScreenAdapter.fontSize(32),
                          ),
                        ),
                        Text(
                          '￥0.00',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: ScreenAdapter.fontSize(50),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '免运费 ',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: ScreenAdapter.fontSize(38),
                          ),
                        ),
                        Text(
                          '优惠:￥0.00 ',
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: ScreenAdapter.fontSize(32),
                          ),
                        ),
                        Text(
                          ' 明细',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: ScreenAdapter.fontSize(38),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: ScreenAdapter.width(30),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(
                      ScreenAdapter.width(30), 0, ScreenAdapter.width(30), 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    child: Text('结算'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleTextStyle: TextStyle(
            fontSize: ScreenAdapter.width(48),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          title: const Text(
            '购物车',
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: TextButton(
                onPressed: () {
                  controller.closeCardList();
                },
                child: Text(
                  '编辑',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: GetBuilder<CartController>(
          initState: (state) {
            controller.getCardList();
          },
          init: controller,
          builder: (controller) {
            return controller.cardList.isNotEmpty
                ? Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: ScreenAdapter.width(40),
                          right: ScreenAdapter.width(40),
                          bottom: ScreenAdapter.width(240),
                        ),
                        child: ListView(
                          children: controller.cardList.map((value) {
                            return CardListView(value);
                          }).toList(),
                        ),
                      ),
                      bottomPositioned()
                    ],
                  )
                : Center(
                    child: Text('购物车没有商品!'),
                  );
          },
        ));
  }
}

                  // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(
                        //       ScreenAdapter.width(20),
                        //     ),
                        //   ),
                        //   child: Column(
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             children: [
                        //               Radio(value: false),
                        //               Text(
                        //                 '小米自营',
                        //                 style: TextStyle(
                        //                   fontSize: ScreenAdapter.fontSize(38),
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //           Row(
                        //             children: [
                        //               Icon(
                        //                 Icons.ice_skating,
                        //                 size: ScreenAdapter.fontSize(28),
                        //               ),
                        //               Padding(
                        //                 padding: EdgeInsetsGeometry.fromLTRB(
                        //                   ScreenAdapter.width(10),
                        //                   ScreenAdapter.width(0),
                        //                   ScreenAdapter.width(40),
                        //                   ScreenAdapter.width(0),
                        //                 ),
                        //                 child: Text(
                        //                   '已免运费',
                        //                   style: TextStyle(
                        //                     color: Colors.black38,
                        //                     fontSize: ScreenAdapter.fontSize(32),
                        //                   ),
                        //                 ),
                        //               )
                        //             ],
                        //           )
                        //         ],
                        //       ),
                        //       CardListView(),
                        //     ],
                        //   ),
                        // ),
