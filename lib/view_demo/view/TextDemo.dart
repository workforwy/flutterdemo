import 'package:flutter/material.dart';

/// TODO
void main() {
  runApp(const MaterialApp(
    title: 'MaterialApp',
    home: TextDemo(),
  ));
}

class TextDemo extends StatelessWidget {
  const TextDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold提供了MD控件必备的元素，比如appbar,Drawer等
      appBar: AppBar(
        title: const Text('TextDemo'),
      ),
      body: Column(
        //列
        children: _setChildren(),
      ),
    );
  }
}

/// 设置所有的列
/// 其中Text的相关属性：
/// color 颜色
/// decoration 删除线
/// decorationColor 删除线颜色
/// decorationStyle 删除线样式
/// fontSize 大小
/// fontStyle 斜体
/// fontFamily 字体
/// fontWeight 字体粗细
/// height 跨度
/// letterSpacing 字母间隔
List<Widget> _setChildren() {
  return <Widget>[
    const Text(
      '红色+黑色删除线+25号',
      style: TextStyle(
        color: Color(0xffff0000),
        decoration: TextDecoration.lineThrough,
        decorationColor: Color(0xff000000),
        fontSize: 25.0,
      ),
    ),
    const Text(
      '橙色+下划线+24号',
      style: TextStyle(
        color: Color(0xffff9900),
        decoration: TextDecoration.underline,
        fontSize: 24.0,
      ),
    ),
    const Text(
      '虚线上划线+23号+倾斜',
      style: TextStyle(
        decoration: TextDecoration.overline,
        decorationStyle: TextDecorationStyle.dashed,
        fontSize: 23.0,
        fontStyle: FontStyle.italic,
      ),
    ),
    const Text(
      'serif字体+24号',
      style: TextStyle(
        fontFamily: 'serif',
        fontSize: 26.0,
      ),
    ),
    const Text(
      'monospace字体+24号+加粗',
      style: TextStyle(
        fontFamily: 'monospace',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    const Text(
      '天蓝色+25号+2行跨度',
      style: TextStyle(
        color: Color(0xff4a86e8),
        fontSize: 25.0,
        height: 2.0,
      ),
    ),
    const Text(
      '24号+2个字母间隔',
      style: TextStyle(
        fontSize: 24.0,
        letterSpacing: 2.0,
      ),
    ),
  ];
}
