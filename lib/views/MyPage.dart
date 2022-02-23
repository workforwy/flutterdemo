/*
 * @Author: wy
 * @Date: 2020-03-31 17:19:26
 * @LastEditors: OBKoro1
 * @LastEditTime: 2020-05-27 11:18:32
 * @FilePath: /FlutterDemo/lib/views/MyPage.dart
 * @Description: 描述
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  MyPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('尾页'),
        ),
        body: new Center(
          child: new Text('我是尾页123'),
        ),
      ),
    );
  }
}
