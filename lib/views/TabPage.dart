import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/AdobeLogo.dart';
import 'package:flutter_app/views/HomePage.dart';
import 'package:flutter_app/views/MainPage.dart';
import 'package:flutter_app/views/MyPage.dart';
import 'package:flutter_app/widget/HomeDrawer.dart';
import 'package:flutter_app/widget/TabBarWidget.dart';

class TabPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //初始化标签
    List<Widget> tabs = [
      _renderTab(new Text("首页")),
      _renderTab(new Text("主页")),
      _renderTab(new Text("我的")),
    ];
    //一个控件，可以监听返回键
    return new WillPopScope(
      child: new TabBarWidget(
        drawer: new HomeDrawer(),
        title: new Text("tab"),
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: tabs,
        tabViews: [
          new HomePage(title: '首页'),
          new MainPage(),
          new MyPage(title: '我的'),

        ],
        backgroundColor: Theme.of(context).primaryColor,
        indicatorColor: Theme.of(context).indicatorColor,
      ),
    );
  }

  _renderTab(text) {
    //返回一个标签
    return new Tab(
        child: new Container(
      //设置paddingTop为6
      padding: new EdgeInsets.only(top: 6),
      //一个列控件
      child: new Column(
        //竖直方向居中
        mainAxisAlignment: MainAxisAlignment.center,
        //水平方向居中
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[text],
      ),
    ));
  }
}
