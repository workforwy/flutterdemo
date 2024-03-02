/*
 * @Author: wy
 * @Date: 2020-03-31 17:19:26
 * @LastEditors: OBKoro1
 * @LastEditTime: 2020-05-27 11:18:32
 * @FilePath: /FlutterDemo/lib/views/MyPage.dart
 * @Description: 描述
 */
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String title;

  const MyPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('尾页'),
        ),
        body: const Center(
          child: Text('我是尾页123'),
        ),
      ),
    );
  }
}
