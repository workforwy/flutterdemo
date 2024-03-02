import 'package:flutter/material.dart';

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
      body: CounterDiaplay(count: _count),
      floatingActionButton: CounterIncrementer(
        onPressed: _increment,
      ),
    );
  }
}

// 简单的封装  计数显示
class CounterDiaplay extends StatelessWidget {
  const CounterDiaplay({Key? key, this.count}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('按钮点击 $count 次}'),
    );
  }
}

// 简单的封装  计数改变
class CounterIncrementer extends StatelessWidget {
  const CounterIncrementer({Key? key, this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: '增加',
      child: const Icon(Icons.add),
    );
  }
}
