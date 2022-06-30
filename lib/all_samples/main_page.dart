import 'package:flutter/material.dart';
import 'package:flutter_app/all_samples/router/router_easy_sample/router_demo.dart';
import 'package:flutterdemo/all_samples/router/router_easy_sample/router_demo.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../demo/CardDemo.dart';
import 'list/list_demo.dart';

void main() {
  runApp(MaterialApp(
    // 路由管理，指定发送到哪个页面
    routes: <String, WidgetBuilder>{
      '/my_normal_page': (BuildContext context) => MyHomePage(),
      '/routers': (BuildContext context) => RouterDemo(),
      '/listview_samples': (BuildContext context) => ListViewDemos(),
    },
    title: 'Flutter控件用法示例大全',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: MainActivity(),
  ));
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('默认页面'), context, '/my_normal_page'),
      buildClicks(buildContents('路由用法Demo'), context, '/routers'),
      buildClicks(
          buildContents('ListView用法Demo'), context, '/listview_samples'),
//      buildClicks2(buildContents('默认页面'), context, new NormalPage()),
//      buildClicks2(buildContents('路由用法Demo'), context, new RouterDemo()),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter控件用法示例大全'),
      ),
      body: Column(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, String routeStr) {
    return InkWell(
      child: child,
      onTapDown: (details) {
        print('onTapDown');
        Fluttertoast.showToast(
            msg: 'onTapDown',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        // 发送路由消息
        Navigator.pushNamed(context, '$routeStr');
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

  Widget buildClicks2(Widget child, BuildContext context, Widget page) {
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
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      constraints: BoxConstraints.expand(height: 56.0),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: BorderRadius.all(
          //让矩形四个角都变成圆角
          const Radius.circular(8.0),
        ),
        // 阴影
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.teal[100],
            offset: Offset(0.0, 5.0),
            blurRadius: 8.0,
          ),
          BoxShadow(
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
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
