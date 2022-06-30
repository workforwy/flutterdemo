/*
 * @Author: wy
 * @Date: 2020-03-31 17:19:26
 * @LastEditors: OBKoro1
 * @LastEditTime: 2020-05-27 11:16:54
 * @FilePath: /FlutterDemo/lib/views/MainPage.dart
 * @Description: 描述
 */
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String title;

  const MainPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('主页'),
        ),
        body: const Center(
          child: Text('这是主页'),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
