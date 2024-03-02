import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Demo4',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const Demo4(),
    ),
  );
}

class Demo4 extends StatelessWidget {
  const Demo4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              print('返回首页');
              Navigator.of(context).pop();
            }),
        title: const Text('Demo4'),
      ),
      body: const Center(
        child: Text('hello world  4'),
      ),
    );
  }
}
