import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Demo2',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Demo2(),
    ),
  );
}

class Demo2 extends StatelessWidget {
  const Demo2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: const Text('Demo2'),
      ),
      body: const Center(
        child: Text('hello world  2'),
      ),
    );
  }
}
