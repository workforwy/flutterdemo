import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  //底部模式
  static const int BOTTOM_TAB = 1;

  //顶部模式
  static const int TOP_TAB = 2;

  final int type;

  //标题集合
  final List<Widget> tabItems;

  //页面集合
  final List<Widget> tabViews;
  final Color backgroundColor;

  //指示器颜色
  final Color indicatorColor;
  final Widget title;

  //抽屉widget
  final Widget drawer;
  final ValueChanged<int> onPageChanged;

  const TabBarWidget({Key? key, required this.type, required this.tabItems, required this.tabViews, required this.backgroundColor, required this.indicatorColor, required this.title, required this.drawer, required this.onPageChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TabBarState(
        type, tabViews, indicatorColor, title, drawer, onPageChanged);
  }
}

//创建State对象，存储TabBarWidget的内部逻辑和变化状态
//with表示扩展，SingleTickerProviderStateMixin是一个扩展（混合）类，它没有构造函数，只能继承自Object。
//一个类可以有多个扩展类，扩展类可以实现方法，接口不能实现方法，只能在实现类里面实现，继承只能是单继承，这就是扩展的好处。
//当有继承，扩展，以及类本身实现同样的功能时，方法调用的优先级是扩展类，函数本身，和父类，第二个扩展类，优先级高于第一个扩展类
class _TabBarState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  final int _type;
  final List<Widget> _tabViews;
  final Color _indicatorColor;
  final Widget _title;
  final Widget _drawer;
  final ValueChanged<int> _onPageChanged;



  //标签控制器，主要是管理标签的行为，比如移动或者跳转到哪一个标签
  TabController _tabController;

  //页面控制器，主要是控制着页面的行为，比如跳转到哪一个页面
  PageController _pageController;

  _TabBarState(this._type, this._tabViews, this._indicatorColor, this._title, this._drawer, this._onPageChanged);

  //初始化方法，当有状态widget已创建，就会为之创建一个state对象，就会调用initState方法
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  //资源释放
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //标签在顶部
    if (_type == TabBarWidget.TOP_TAB) {
      //这个类主要是可以实现展示drawer、snack bar、bottom sheets的功能
      return Scaffold(
        //抽屉界面
        drawer: _drawer,
        //一个放在屏幕顶端的高度合适的控件，即标题栏，典型的应用就是放在Scaffold中使用。
        appBar: AppBar(
          //背景
          backgroundColor: Theme.of(context).primaryColor,
          //名称
          title: _title,
          //Material 设计的控件，用来展示一行标签，通过它，标签控制器和标签进行了绑定
          bottom: TabBar(
            //持有的标签
            tabs: widget.tabItems,
            //控制标签行为的控制器
            controller: _tabController,
            //指示器
            indicatorColor: _indicatorColor,
            //标签点击事件
            onTap: (index) {
              //点击标签切换页面
              _pageController.jumpToPage(index);
            },
          ),
        ),
        //表示一个可以一页一页滚动的列表，每一个页面都和view窗口的大小一样
        //通过这个类，页面控制器和页面进行了绑定
        body: PageView(
          //页面控制器
          controller: _pageController,
          //具体的页面集合
          children: _tabViews,
          //页面滑动触发回调
          onPageChanged: (index) {
            //标签进行相应的改变
            _tabController.animateTo(index);
            //一个监听回调
            _onPageChanged.call(index);
          },
        ),
      );
    }
    //标签在底部
    return Scaffold(
      drawer: _drawer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: _title,
      ),
      //一个能和选择的标签进行同步的页面控件，经常和TabBar一起使用，通过它标签控制器和页面进行了绑定，可以同步展示
      body: TabBarView(
        children:
            //所有的子页面
            _tabViews,
        //标签控制器
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColor,
        //通过它标签控制器和所有的标签又进行了绑定，
        //那么最终标签和页面的行为进行绑定，他们就可以进行同步展示了
        child: TabBar(
          tabs: widget.tabItems,
          indicatorColor: _indicatorColor,
          controller: _tabController,
        ),
      ),
    );
  }
}
