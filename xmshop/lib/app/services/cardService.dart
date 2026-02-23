import 'storage.dart';

import '../models/pcontent_model.dart';

class CardService {
  CardService();

  //  1、获取本地存储的cartList数据
  //       2、判断cartList是否有数据
  //             有数据：
  //                 1、判断购物车有没有当前数据：
  //                         有当前数据：
  //                             1、让购物车中的当前数据数量 等于以前的 数量+现在的数量
  //                             2、重新写入本地存储

  //                         没有当前数据：
  //                             1、把购物车cartList的数据和当前数据拼接，拼接后重新写入本地存储。

  //             没有数据：
  //                 1、把当前商品数据以及属性数据放在数组中然后写入本地存储

  //
  static Future<void> addCard(
      PcontentItemModel pcontent, String selectAttr, int buyNum) async {
    List? cardListData = await Storage.getData('cardList');

    if (cardListData != null) {
      var hasData = cardListData.any((v) {
        return v['_id'] == pcontent.sId && v['selectedAttr'] == selectAttr;
      });

      if (hasData) {
        for (var i = 0; i < cardListData.length; i++) {
          if (cardListData[i]["_id"] == pcontent.sId &&
              cardListData[i]["selectedAttr"] == selectAttr) {
            cardListData[i]["count"] += buyNum;
          }
          await Storage.setData("cardList", cardListData);
        }
      } else {
        cardListData.add({
          '_id': pcontent.sId,
          'title': pcontent.title,
          'price': pcontent.price,
          'selectedAttr': selectAttr,
          "pic": pcontent.pic,
          "checked": true,
          "count": buyNum
        });
        await Storage.setData('cardList', cardListData);
      }
    } else {
      List tempList = [];
      tempList.add({
        '_id': pcontent.sId,
        'title': pcontent.title,
        'price': pcontent.price,
        'selectedAttr': selectAttr,
        "pic": pcontent.pic,
        "checked": true,
        "count": buyNum
      });
      await Storage.setData('cardList', tempList);
    }
  }

  static Future<List<dynamic>> getCardList() async {
    List? cardList = await Storage.getData('cardList');
    if (cardList != null) {
      return cardList;
    } else {
      return [];
    }
  }

  static Future<void> clearCardList() async {
    await Storage.clear("cardList");
  }

  static void setCartList(cartListData) async {
    await Storage.setData("cardList", cartListData);
  }
}
