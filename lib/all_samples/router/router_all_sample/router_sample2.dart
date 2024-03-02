import 'package:flutter/material.dart';

// 使用命名路由进行导航
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter 路由Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
      initialRoute: '/page_one',
      routes: {
        '/page_one': (context) => const MyHomePage(),
        '/jump_page_two': (context) => const MyApp(),
      },
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
          Navigator.pushNamed(context, '/jump_page_two');
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
