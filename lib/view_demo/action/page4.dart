import 'package:flutter/material.dart';

/// 交互
void main() {
  runApp(const MaterialApp(
    title: '交互',
    home: Counter(),
  ));
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0; //计数

  void _increment() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('交互'),
      ),
      body: Center(
        child: Text('按钮点击 $_count 次}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: '增加',
        child: const Icon(Icons.add),
      ),
    );
  }
}
