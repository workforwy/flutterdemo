import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/HomeDrawer.dart';
import '../widget/TabBarWidget.dart';
import 'HomePage.dart';
import 'MainPage.dart';
import 'MyPage.dart';

void main() {
  runApp(const TabPage());
}

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化标签
    List<Widget> tabs = [
      _renderTab(const Text("首页")),
      _renderTab(const Text("主页")),
      _renderTab(const Text("我的")),
    ];
    //一个控件，可以监听返回键
    return WillPopScope(
      onWillPop: () {},
      child: TabBarWidget(
        drawer: HomeDrawer(),
        title: const Text("tab"),
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          HomePage(),
          MainPage(),
          MyPage(),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        indicatorColor: Theme.of(context).indicatorColor,
        onPageChanged: (int value) {},
      ),
    );
  }

  _renderTab(text) {
    //返回一个标签
    return Tab(
        child: Container(
      //设置paddingTop为6
      padding: const EdgeInsets.only(top: 6),
      //一个列控件
      child: Column(
        //竖直方向居中
        mainAxisAlignment: MainAxisAlignment.center,
        //水平方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[text],
      ),
    ));
  }
}
