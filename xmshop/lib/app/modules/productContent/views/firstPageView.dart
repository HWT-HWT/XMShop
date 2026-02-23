import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_content_controller.dart';
import '../../../services/screebAdapter.dart';
import '../../../services/httpsClient.dart';

class Firstpageview extends GetView<ProductContentController> {
  final Function showButtomAttr;
  const Firstpageview(this.showButtomAttr, {super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.pcontent.value.sId != null
          ? Container(
              key: controller.gk1,
              alignment: Alignment.center,
              width: ScreenAdapter.width(1080),
              // height: ScreenAdapter.heigth(1980),
              color: Colors.white,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 图片
                  AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      HttpsClient.replaeUrl(controller.pcontent.value.pic),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 标题
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                    child: Text(
                      '${controller.pcontent.value.title}',
                      style: TextStyle(
                          fontSize: ScreenAdapter.fontSize(50),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // 小标题
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                    child: Text(
                      '${controller.pcontent.value.subTitle}',
                      style: TextStyle(
                        fontSize: ScreenAdapter.fontSize(34),
                      ),
                    ),
                  ),
                  // 价格
                  Container(
                    padding: EdgeInsets.all(ScreenAdapter.heigth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('价格: '),
                            Text(
                              '￥${controller.pcontent.value.price}',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenAdapter.fontSize(60),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('原价: '),
                            Text(
                              '￥${controller.pcontent.value.oldPrice}',
                              style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenAdapter.fontSize(46),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // 筛选
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40),
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40)),
                    child: GestureDetector(
                      onTap: () {
                        showButtomAttr(1);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  '已选',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsetsGeometry.only(
                                    left: ScreenAdapter.width(100),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.selectAttr}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: ScreenAdapter.fontSize(38),
                                        ),
                                      ),
                                      Text(
                                        '可增值服务',
                                        style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: ScreenAdapter.fontSize(32),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40),
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '门店',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(
                                    left: ScreenAdapter.width(100)),
                                child: Text(
                                  '小米之家万达专卖',
                                  style: TextStyle(
                                    fontSize: ScreenAdapter.fontSize(38),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40),
                        ScreenAdapter.width(20),
                        ScreenAdapter.width(40)),
                    child: GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                '服务',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: ScreenAdapter.width(120),
                              ),
                              Icon(
                                Icons.youtube_searched_for,
                                size: ScreenAdapter.fontSize(50),
                                color: Colors.black38,
                              ),
                              Text(
                                '- 小米直营',
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(30),
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: ScreenAdapter.width(20),
                              ),
                              Icon(
                                Icons.youtube_searched_for,
                                size: ScreenAdapter.fontSize(50),
                                color: Colors.black38,
                              ),
                              Text(
                                '- 小米直营',
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(30),
                                  color: Colors.black38,
                                ),
                              ),
                              SizedBox(
                                width: ScreenAdapter.width(20),
                              ),
                              Icon(
                                Icons.youtube_searched_for,
                                size: ScreenAdapter.fontSize(50),
                                color: Colors.black38,
                              ),
                              Text(
                                '- 小米直营',
                                style: TextStyle(
                                  fontSize: ScreenAdapter.fontSize(30),
                                  color: Colors.black38,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black26,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : SizedBox(
              height: ScreenAdapter.heigth(1980),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }
}
