import 'package:flutter/material.dart';

// 通过路由将数据传递给另一个页面
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter 路由Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  final List<String> datas = ["橘子", "苹果", "香蕉", "柚子"];

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter 路由Demo')),
      body: RaisedButton(
        color: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // 路由跳转 并向新页面传递数组
              builder: (context) => MyApp(data: datas),
            ),
          );
        },
        child: const Text(
          '跳转到下一个页面',
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final List<String> data;

  const MyApp({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tempData = "";

    for (var data in data) {
      tempData += data;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tempData),
      ),
      body: RaisedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text('返回上一个页面'),
      ),
    );
  }
}
