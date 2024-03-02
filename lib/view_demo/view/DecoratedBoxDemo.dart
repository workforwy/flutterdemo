import 'package:flutter/material.dart';
import 'FractionalOffsetUtil.dart';

/// DecoratedBox 装饰容器的使用
/// DecoratedBox 控件会在子控件绘制之前或之后绘制一个装饰。
void main() {
  runApp(MaterialApp(
    title: 'DecoratedBoxDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const DecoratedBoxDemo(),
  ));
}

class DecoratedBoxDemo extends StatelessWidget {
  const DecoratedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DecoratedBoxDemo'),
      ),
      body: Center(
        //居中
        child: SizedBox(
          //设置大小
          width: 250.0,
          height: 150.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              //线性渐变
//              gradient: setFractionalOffsets(Types.leftToRight, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.leftToRight, null),
//              gradient: setFractionalOffsets(Types.rightToLeft, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.rightToLeft, null),
//              gradient: setFractionalOffsets(Types.topToBottom, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.topToBottom, null),
//              gradient: setFractionalOffsets(Types.bottomToTop, Direction.firstDirection),
//              gradient: setFractionalOffsets(Types.bottomToTop, null),
              gradient: setFractionalOffsets(Types.leftTopToRightBottom, null),
//              gradient: setFractionalOffsets(Types.rightBottomToLeftTop, null),
//              gradient: setFractionalOffsets(Types.rightTopToLeftBottom, null),
//              gradient: setFractionalOffsets(Types.leftBottomToRightTop, null),
            ),
          ),
        ),
      ),
    );
  }
}
