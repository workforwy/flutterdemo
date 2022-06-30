import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'demo1.dart';
import 'demo2.dart';
import 'demo3.dart';
import 'demo4.dart';

// 路由的简单使用示例：
void main() {
  runApp(MaterialApp(
    title: '路由Demo',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: const RouterDemo(),
  ));
}

class RouterDemo extends StatelessWidget {
  const RouterDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('按钮1'), context, Demo1()),
      buildClicks(buildContents('按钮2'), context, Demo2()),
      buildClicks(buildContents('按钮3'), context, Demo3()),
      buildClicks(buildContents('按钮4'), context, Demo4()),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: const Text('路由Demo'),
      ),
      body: Column(children: widgets),
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
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(height: 56.0),
      decoration: BoxDecoration(
        color: Colors.teal[300],
        borderRadius: const BorderRadius.all(
          //让矩形四个角都变成圆角
          Radius.circular(8.0),
        ),
        // 阴影
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.teal,
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
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
