import 'package:flutter/material.dart';

/// 堆叠视图
void main() {
  runApp(MaterialApp(
    title: '',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const StackDemo(),
  ));
}

class StackDemo extends StatelessWidget {
  const StackDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.network(
              'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
              scale: 2.0,
            ),
            const Positioned(
              left: 10.0,
              right: 10.0,
              top: 10.0,
              child: Text(
                '这是上层的布局',
                style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.deepOrange,
                  fontFamily: 'serif',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
