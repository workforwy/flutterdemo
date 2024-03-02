import 'package:flutter/material.dart';

/// RaisedButton 的基本使用
void main() {
  runApp(MaterialApp(
    title: 'RaisedButton',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const RaisedButtonDemo(),
  ));
}

class RaisedButtonDemo extends StatelessWidget {
  const RaisedButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RaisedButton'),
      ),
      body: Center(
        //使子控件在其内部水平和垂直居中
        child: Container(
          width: 300.0,
          height: 200.0,
          decoration: BoxDecoration(
            color: Colors.pink,
            border: Border.all(
              //设置Border属性给容器添加边框
              color: const Color(0xff6d9eeb), //为边框添加颜色
              width: 8.0, //边框宽度
            ),
          ),
          child: RaisedButton(
            onPressed: null,
          ),
        ),
      ),
    );
  }
}
