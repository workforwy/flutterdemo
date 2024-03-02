import 'package:flutter/material.dart';

/// Opacity控件能调整子控件的不透明度，使子控件部分透明，
/// 不透明度的量从0.0到1.1之间，0.0表示完全透明，1.1表示完全不透明。
/// 即使子控件颜色带有透明度，例如：0xFF990D47A1，也会在这个颜色基础上再去设置透明度。
void main() {
  runApp(MaterialApp(
    title: 'OpacityDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const OpacityDemo(),
  ));
}

class OpacityDemo extends StatelessWidget {
  const OpacityDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpacityDemo'),
      ),
      body: Center(
          child: Opacity(
        opacity: 0.0,
        child: Container(
          width: 250.0,
          height: 100.0,
          decoration: const BoxDecoration(
            color: Color(0xff990d47a1),
          ),
        ),
      )),
    );
  }
}
