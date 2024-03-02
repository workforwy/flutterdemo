import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 本demo 来源于： https://blog.csdn.net/column/details/13593.html?&page=4
/// 事件的操作，另外这里引入了toast库
void main() {
  runApp(MaterialApp(
    title: 'MaterialApp',
    theme: ThemeData(
      primaryColor: Colors.red, //设置appbar主题
      primarySwatch: Colors.deepOrange, //设置全局主题
    ),
    home: const MyGestureDetector(),
  ));
}

/// 手势操作
class MyGestureDetector extends StatelessWidget {
  const MyGestureDetector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton被监听了！');
        Fluttertoast.showToast(
          msg: "MyButton被监听了！ short toast",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      },
      child: Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.deepOrange,
        ),
        child: const Center(
          child: Text('点击监听'),
        ),
      ),
    );
  }
}
