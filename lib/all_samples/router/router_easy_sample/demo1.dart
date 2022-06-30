import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Demo1',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Demo1(),
    ),
  );
}

class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //背景色
        backgroundColor: Colors.red,
        // icon的主题色
        iconTheme: const IconThemeData(color: Colors.tealAccent),
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: const Text(
          'Demo1',
          style: TextStyle(color: Colors.tealAccent),
        ),
      ),
      body: const Center(
        child: Text('hello world'),
      ),
    );
  }
}
