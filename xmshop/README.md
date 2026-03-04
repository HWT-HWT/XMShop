# 练习项目 

# 标有 *** 则是知识重点


# 1.GetX创建项目
    get create project:xmshop

# 2.添加taber页面
    底部tbaer添加 首页 分类 服务 购物车 个人页 taber
    get page:model page

    2.1 删除路由
        使用getx添加页面 getx会自行添加路由 首页 分类页面是在taber进行渲染
        routes/app_pages.dart
        
    2.2 在taber页面下使用bottomNavigationBar添加底部taber
        items配置图标跟页面名字
        还需添加切换下标 currentIndex
        点击 切换下标 选中对应页面
        
        PageView(
          <!-- 绑定pageController -->
          controller: controller.pageController,
          <!-- 禁止滑动事件 -->
          physics: NeverScrollableScrollPhysics(),
          <!-- 每个页面渲染 数组-->
          children: controller.pages,
          <!-- 页面滑动切换页面 -->
          onPageChanged: (index) {
            controller.setCurrentIndex(index);
          },
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          选中颜色
          fixedColor: Colors.red,
          默认下标 下标为选中页面
          currentIndex: controller.currentIndex.value,
          绝对定位 让其固定在最下方
          type: BottomNavigationBarType.fixed,
          点击事件
          onTap: (index) {
            <!-- index 为点击第几个按钮 -->
            controller.setCurrentIndex(index);
            <!-- 实现无动画跳转 -->
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


# 3.适配不同屏幕
    使用三方插件 flutter_screenutil 
    配置自定义适配类
    在services文件下创建screebAdapter.dart
    在页面中可以使用screenbAdapter.XXX(int);

# 4.透明顶部导航 taber栏切换动画效果
    4.1
    使用Positioned定位到home页最上方

    4.2 ***
    AnimatedContainer动画效果组件
    通过新旧值来产生动画效果
    例如 宽度从小变大 从大变小
    设置 duration:Duration(milliseconds: 600) 可以控制效果时间 

    4.3
    AppBar组件设置透明导航
    backgroundColor:controller.flage.value ? Colors.white : Colors.transparent,

    4.4
    使用listView组件绑定监听屏幕滑动事件
    当页面滑动到一定距离时将controller.flage.value = true || false 进行控制AnimatedContainer动画效果组件

# 5 首页轮播图
    5.1
    使用 flutter_swiper_view 1.1.8 插件

    使用方法
    Swiper(
      <!-- 设置几张轮播图 -->
      itemCount: controller.swiperList.length,
      itemBuilder: (context, index) {
        <!-- 循环渲染图片 -->
        return Image.network(
          <!-- HttpsClient 自定义转换url方法 -->
          HttpsClient.replaeUrl(controller.swiperList[index].pic),
          fit: BoxFit.cover,
        );
      },
      <!-- 配置分页器 -->
      pagination: const SwiperPagination(builder: SwiperPagination.rect),
      <!-- 自动轮播 -->
      autoplay: true,
      <!-- 循环页面 -->
      loop: true,
    ),

# 6 Dio请求基地址 请求数据
    6.1
      下载依赖 flutter pub add dio
      配置请求基地址
      在services文件下创建htppsClient.dart
      import 'package:dio/dio.dart';

      class HttpsClient {
        <!-- 设置基地址 -->
        static String domain = 'https://miapp.itying.com/';

        <!-- 初始化 dio -->
        static Dio dio = Dio();

        <!-- 设置请求 -->
        HttpsClient() {
          <!-- 配置默认请求url -->
          dio.options.baseUrl = domain;
          <!-- 设置请求超时时间 -->
          dio.options.connectTimeout = Duration(seconds: 5);
          <!-- 设置响应超时时间 -->
          dio.options.receiveTimeout = Duration(seconds: 3);
        }

        <!-- 设置异步类 get请求 -->
        Future get(apiUrl) async {
          try {
            <!-- 发起请求 -->
            var response = await dio.get(apiUrl);
            <!-- 返回数据 -->
            return response;
          } catch (e) {
            <!-- 报错 -->
            print('请求超时');
            return null;
          }
        }

        <!-- 自定义设置 重置url请求路径 把 “\” 改为 “/” -->
        static String replaeUrl(dynamic picUrl) {
          String tempUrl = domain + picUrl;
          return tempUrl.replaceAll('\\', '/');
        }
      }
    6.2 使用getx的中模型类进行解析api接口
      get generate model on XXX from "https://xiaomi.itying.com/api/focus"
      在models文件下生成XXX.dart
      
      使用方法
      <!-- 使用封装的请求接口 请求数据 -->
      var response = await httpsClient.get('api/focus');
      

      if (response != null) {
        <!-- 需要先引入生产的文件 再进行调用 它的fromJson方法传入请求的数据 就可以实现不需要多次list['arr'] ===> list.arr -->
        var focus = FocusModel.fromJson(response.data);
        swiperList.value = focus.result!;
        update();
      }

# 7 首页轮播分类数据
  7.1
  使用 flutter_swiper_view 1.1.8 插件

  <!-- 设置swiper依赖 -->
  
  <!-- 设置几个轮播页面 -->
  <!-- 这里进行了除以10 是因为 请求分类 十条数据为一页  -->
  itemCount: controller.categoryList.length ~/ 10,
  
  <!-- 文档中复制 依赖查找 SwiperCustomPagination -->
  pagination: SwiperPagination(
    margin: const EdgeInsets.all(0.0),
    builder: SwiperCustomPagination(
      builder: (BuildContext context, SwiperPluginConfig config) {
        return ConstrainedBox(
          constraints: BoxConstraints.expand(
            <!-- 设置指示器的高度 -->
            height: ScreenAdapter.heigth(40),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: const RectSwiperPaginationBuilder(
                    <!-- 修改指示器颜色 -->
                    color: Colors.black12,
                    activeColor: Colors.black54,
                  ).build(context, config),
                ),
              ),
            ],
          ),
        );
      },
    ),
  ),

  GridView.builder实现轮播分类

  GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      <!-- 一行五个 -->
      crossAxisCount: 5,
      <!-- 主轴间隙 -->
      mainAxisSpacing: 10,
    ),
    <!-- 是个一组 -->
    itemCount: 10,
    itemBuilder: (BuildContext context, int i) {
      return Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: ScreenAdapter.heigth(140),
            height: ScreenAdapter.heigth(140),
            child: Image.network(
              HttpsClient.replaeUrl(
                controller.categoryList[index * 10 + i].pic,
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenAdapter.heigth(5)),
            child: Text(
              '${controller.categoryList[index * 10 + i].title}',
              style: TextStyle(fontSize: ScreenAdapter.fontSize(30)),
            ),
          ),
        ],
      );
    },
  );

 # 8.瀑布流布局
 <!-- 使用MasonryGridView -->
 MasonryGridView.count(
  <!-- 设置两列 -->
    crossAxisCount: 2,
    <!-- 主轴距离 -->
    mainAxisSpacing: ScreenAdapter.width(25),
    <!-- 间距 -->
    crossAxisSpacing: ScreenAdapter.width(20),
    <!-- 渲染个数 -->
    itemCount: controller.bestLit.length,
    <!-- 约束组件 防止溢出 -->
    shrinkWrap: true,
    <!-- 禁止滑动/滚动事件 -->
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      布局
    }
)
