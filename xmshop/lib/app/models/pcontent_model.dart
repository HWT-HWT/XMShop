class PcontentModel {
  PcontentItemModel? result;

  PcontentModel({this.result});

  // 修复：去掉 Result? 中的多余问号，改为 Result.fromJson
  PcontentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? PcontentItemModel.fromJson(json['result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.toJson();
    }
    return data;
  }
}

class PcontentItemModel {
  String? sId;
  String? title;
  String? cid;
  int? price;
  int? oldPrice;
  int? isBest;
  int? isHot;
  int? isNew;
  List<PcontentAttrModel>? attr;
  int? status;
  String? pic;
  String? content;
  String? cname;
  int? salecount;
  String? subTitle;
  String? specs;
  int? count;

  PcontentItemModel(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.oldPrice,
      this.isBest,
      this.isHot,
      this.isNew,
      this.attr,
      this.status,
      this.pic,
      this.content,
      this.cname,
      this.salecount,
      this.subTitle,
      this.specs,
      this.count});

  PcontentItemModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    oldPrice = json['old_price'];
    isBest = json['is_best'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    if (json['attr'] != null) {
      attr = <PcontentAttrModel>[];
      json['attr'].forEach((v) {
        attr?.add(PcontentAttrModel.fromJson(v));
      });
    }
    status = json['status'];
    pic = json['pic'];
    content = json['content'];
    cname = json['cname'];
    salecount = json['salecount'];
    subTitle = json['sub_title'];
    specs = json['specs'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['old_price'] = oldPrice;
    data['is_best'] = isBest;
    data['is_hot'] = isHot;
    data['is_new'] = isNew;
    if (attr != null) {
      data['attr'] = attr?.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['pic'] = pic;
    data['content'] = content;
    data['cname'] = cname;
    data['salecount'] = salecount;
    data['sub_title'] = subTitle;
    data['specs'] = specs;
    data['count'] = count;
    return data;
  }
}

class PcontentAttrModel {
  String? cate;
  List<String>? list;
  // 修复：attrList 类型改为 dynamic（因为原代码中 Null 没有 fromJson 方法）
  List<dynamic>? attrList;

  PcontentAttrModel({this.cate, this.list, this.attrList});

  PcontentAttrModel.fromJson(Map<String, dynamic> json) {
    cate = json['cate'];
    list = json['list']?.cast<String>(); // 增加 ? 避免空值调用
    // 修复：去掉 Null.fromJson(v)，直接赋值（如果后端返回 attrList 为 null/数组）
    attrList = json['attrList'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cate'] = cate;
    data['list'] = list;
    if (attrList != null) {
      data['attrList'] = attrList; // 直接赋值，无需调用 toJson
    }
    return data;
  }
}
