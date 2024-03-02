import 'package:flutter/material.dart';

// 这是路由的完整使用示例
// 使用Navigator.push实现发送路由，Navigator.pop返回上一个页面。
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
              builder: (context) => const MyApp(),
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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 路由Demo'),
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
