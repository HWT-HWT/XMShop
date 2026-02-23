import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './card_num_view.dart';
import 'package:xmshop/app/services/screebAdapter.dart';
import '../../../services/httpsClient.dart';

class CardListView extends GetView {
  final Map cardItem;
  const CardListView(this.cardItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/product-content', arguments: {'id': cardItem['_id']});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(ScreenAdapter.width(20))),
        margin: EdgeInsets.only(
          top: ScreenAdapter.width(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.red,
                  value: false,
                  onChanged: (value) {},
                ),
                SizedBox(
                  width: ScreenAdapter.width(250),
                  height: ScreenAdapter.heigth(250),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(
                      ScreenAdapter.width(20),
                    ),
                    child: Image.network(
                      HttpsClient.replaeUrl(cardItem['pic']),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsetsGeometry.all(
                  ScreenAdapter.heigth(50),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${cardItem['title']}'),
                    Container(
                      height: ScreenAdapter.heigth(60),
                      margin: EdgeInsets.only(
                          top: ScreenAdapter.heigth(20),
                          bottom: ScreenAdapter.heigth(40)),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(
                          ScreenAdapter.width(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${cardItem['selectedAttr']}',
                            style:
                                TextStyle(fontSize: ScreenAdapter.fontSize(28)),
                          ),
                          Padding(
                            padding: EdgeInsetsGeometry.only(
                              left: ScreenAdapter.width(2),
                            ),
                            child: Icon(
                              Icons.border_bottom_sharp,
                              size: ScreenAdapter.fontSize(28),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('￥${cardItem['price']}'),
                        CardNumView(cardItem),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
