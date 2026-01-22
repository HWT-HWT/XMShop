import 'package:get/get.dart';
import '../../../models/category_model.dart';
import '../../../services/httpsClient.dart';

class CategoryController extends GetxController {
  RxInt selectIndex = 0.obs;

  // 一级导航数据
  RxList leftCategoryList = [].obs;

  // 二级导航数据
  RxList rightCategoryList = [].obs;

  HttpsClient httpsClient = HttpsClient();

  @override
  void onInit() {
    super.onInit();
    getLeftCategoryList();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // 一级导航点击切换数据
  void changeIndex(int index, id) => {
    selectIndex.value = index,
    getRightCategoryList(id),
    update(),
  };

  // 获取一级导航数据
  void getLeftCategoryList() async {
    var response = await httpsClient.get('api/pcate');
    if (response != null) {
      var leftCategory = CategoryModel.fromJson(response.data!);
      leftCategoryList.value = leftCategory.result!;
      getRightCategoryList(leftCategoryList[0].sId);
      update();
    }
  }

  // 获取二级导航数据
  void getRightCategoryList(String pid) async {
    var response = await httpsClient.get('api/pcate?pid=$pid');
    if (response != null) {
      var rightCategory = CategoryModel.fromJson(response.data!);
      rightCategoryList.value = rightCategory.result!;
      update();
    }
  }
}
