import 'package:flutter/material.dart';

/// 手势demo
/// 这里主要是测试一下手势事件的执行顺序
void main() {
  runApp(
    MaterialApp(
      title: 'ShouShiDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: const ShouShiDemo(),
    ),
  );
}

class ShouShiDemo extends StatelessWidget {
  const ShouShiDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShouShiDemo'),
      ),
      body: GestureDetector(
        //单击
        onTap: () {
          print('GestureDetector onTap =====》 单击');
        },
        onTapDown: (TapDownDetails details) {
          print('GestureDetector onTapDown =====》 按下');
        },
        onTapUp: (TapUpDetails details) {
          print('GestureDetector onTapUp =====》 手指抬起');
        },
        onTapCancel: () {
          print('GestureDetector onTapCancel =====》 取消');
        },
        //双击
        onDoubleTap: () {
          print('GestureDetector onDoubleTap =====》 双击');
        },
        //长按
        onLongPress: () {
          print('GestureDetector onLongPress =====》 长按');
        },
        //垂直拖动
        onVerticalDragDown: (DragDownDetails details) {},
        onVerticalDragStart: (DragStartDetails details) {},
        onVerticalDragUpdate: (DragUpdateDetails details) {},
        onVerticalDragEnd: (DragEndDetails details) {},
        onVerticalDragCancel: () {},
        //水平拖动
        onHorizontalDragDown: (DragDownDetails details) {},
        onHorizontalDragStart: (DragStartDetails details) {},
        onHorizontalDragUpdate: (DragUpdateDetails details) {},
        onHorizontalDragEnd: (DragEndDetails details) {},
        onHorizontalDragCancel: () {},
//        // 这几个不常用 就不介绍了
//        onPanDown: ,
//        onPanStart: ,
//        onPanUpdate: ,
//        onPanEnd: ,
//        onPanCancel: ,
//        onScaleStart: ,
//        onScaleUpdate: ,
//        onScaleEnd: ,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: const BorderRadius.only(),
            border: Border.all(color: Colors.red),
          ),
          //InkWell水波纹带有效果，同时带有点击事件
          child: InkWell(
            child: const Text('手势动画'),
            onTap: () {
              print('InkWell  onTap ==》 单击');
            },
            onTapDown: (TapDownDetails details) {
              print('InkWell  onTapDown ==》 按下');
            },
            onTapCancel: () {
              print('InkWell  onTapCancel ==》 取消');
            },
            onDoubleTap: () {
              print('InkWell  onDoubleTap ==》 双击');
            },
            onLongPress: () {
              print('InkWell  onLongPress ==》 长按');
            },
          ),
//          child: new Text('手势动画'),
        ),
      ),
    );
  }
}


// 经测试发现，手势的顺序如下：

// 单独使用GestureDetector：

// 单击会依次触发：
// onTapDown //按下
// onTapUp //手指抬起
// onTap //单击

// 双击会依次触发：
// onTapCancel //手势取消
// onDoubleTap //双击

// 长按会依次触发：
// onTapDown //按下
// onTapCancel //手势取消
// onLongPress //长按

// --------------------

// 单独使用InkWell：

// 单击会依次触发：
// onTapDown //按下
// onTap //单击

// 双击会依次触发：
// onTapCancel //手势取消
// onDoubleTap //双击

// 长按会依次触发：
// onTapDown //按下
// onTapCancel //手势取消
// onLongPress //长按


// ---------------------

// GestureDetector和InkWell同时使用，看看效果：

// 单击会依次触发：
// InkWell  onTapDown ==》 按下
// GestureDetector onTapDown =====》 按下
// InkWell  onTap ==》 单击
// GestureDetector onTapCancel =====》 取消

// 双击会依次触发：
// InkWell  onTapCancel ==》 取消
// GestureDetector onTapCancel =====》 取消
// InkWell  onDoubleTap ==》 双击

// 长按会依次触发：
// InkWell  onTapDown ==》 按下
// GestureDetector onTapDown =====》 按下
// InkWell  onTapCancel ==》 取消
// GestureDetector onTapCancel =====》 取消
// InkWell  onLongPress ==》 长按