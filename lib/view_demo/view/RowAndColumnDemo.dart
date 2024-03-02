import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// TODO
void main() {
  runApp(MaterialApp(
    title: '水平垂直布局',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const RowDemo(),
  ));
}

class RowDemo extends StatelessWidget {
  const RowDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('水平垂直布局'),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              print('点击红色按钮事件');
              ShowToast('点击红色按钮事件');
            },
            color: const Color(0xffcc0000),
            child: const Text('红色按钮'),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                print('点击黄色按钮事件');
                ShowToast('点击黄色按钮事件');
              },
              color: const Color(0xfff1c232),
              child: const Text('黄色按钮'),
            ),
          ),
          RaisedButton(
            onPressed: () {
              print('点击粉色按钮事件');
              ShowToast('点击粉色按钮事件');
            },
            color: const Color(0xffea9999),
            child: const Text('粉色按钮'),
          ),
//          new Expanded(
//            flex: 3,
//            child: new RaisedButton(
//              onPressed: () {
//                print('点击绿色按钮事件');
//                ShowToast('点击绿色按钮事件');
//              },
//              color: const Color(0xff00ff00),
//              child: new Text('绿色按钮'),
//            ),
//          ),
        ],
      ),
    );
  }
}

void ShowToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
