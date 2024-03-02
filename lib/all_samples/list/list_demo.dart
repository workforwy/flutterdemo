import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'listview_customscrollview.dart';
import 'listview_dividers.dart';
import 'listview_gridview.dart';
import 'listview_horizontal.dart';
import 'listview_listtitle.dart';
import 'listview_longlist.dart';
import 'listview_multi_item.dart';
import 'listview_multi_level.dart';
import 'listview_radio_listtitle.dart';
import 'listview_simple.dart';
import 'listview_sliver.dart';
import 'sliver_vs_grid.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CustomScrollView创建一个列表',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: const ListViewDemos(),
    ),
  );
}

class ListViewDemos extends StatelessWidget {
  const ListViewDemos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(
          buildContents('简单ListViewDemo'), context, const ListViewSimpleDemo()),
      buildClicks(
          buildContents('ListView带分割线'), context, const ListViewDividerDemo()),
      buildClicks(buildContents('ListView.builder构建长列表'), context,
           ListViewLongListDemo()),
      buildClicks(
          buildContents('横向ListView'), context, const ListViewHorizontalDemo()),
      buildClicks(
          buildContents('ListTile的使用'), context, const ListViewListTileDemo()),
      buildClicks(buildContents('ListView的RadioListTile的切换'), context,
          const RadioListTileDemo()),
      buildClicks(buildContents('使用CustomScrollView创建列表'), context,
          const ListViewCustomScrollViewDemo()),
      buildClicks(
          buildContents('创建GridView列表'), context, const ListViewGridViewDemo()),
      buildClicks(
          buildContents('可折叠的AppBar+ListView'), context, const ListViewSliverDemo()),
      buildClicks(
          buildContents('多条目的ListView的demo'), context, const ListViewMultiItemDemo()),
      buildClicks(buildContents('多级列表Demo'), context, const ListViewMultiLevelDemo()),
      buildClicks(buildContents(' SliverGrid 和 GridView 的对比'), context,
          const SliverGridVSGridView()),
      // buildClicks(buildContents('垂直listview嵌套水平的listview'), context,
      //     new ListViewNestedDemo()),
      const Text(''),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: const Text('ListView用法Demo'),
      ),
      body: ListView(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, Widget page) {
    return InkWell(
      child: child,
      onTapDown: (details) {
        print('onTapDown');
        Fluttertoast.showToast(
            msg: 'onTapDown',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        // 发送路由消息
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => page));
      },
      onTap: () {
        Fluttertoast.showToast(
            msg: 'onTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onLongPress: () {
        Fluttertoast.showToast(
            msg: 'onLongPress',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onDoubleTap: () {
        Fluttertoast.showToast(
            msg: 'onDoubleTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
    );
  }

  Widget buildContents(var text) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(height: 40.0),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: const BorderRadius.all(
          //让矩形四个角都变成圆角
          Radius.circular(8.0),
        ),
        // 阴影
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: (Colors.teal[100])!,
            offset: const Offset(0.0, 5.0),
            blurRadius: 8.0,
          ),
          const BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 6.0),
            blurRadius: 8.0,
          ),
        ],
      ),
      child: buildButton(text),
    );
  }

  Widget buildButton(var text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
