import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Demo3',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const Demo3(),
    ),
  );
}

class Demo3 extends StatelessWidget {
  const Demo3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: const Text('Demo3'),
      ),
      body: const Center(
        child: Text('hello world  3'),
      ),
    );
  }
}
