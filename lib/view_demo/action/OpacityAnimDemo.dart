import 'package:flutter/material.dart';

/// 不透明度动画demo
void main() {
  runApp(MaterialApp(
    title: 'AnimDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const AnimDemo(),
  ));
}

class AnimDemo extends StatefulWidget {
  const AnimDemo({Key? key}) : super(key: key);

  @override
  _AnimDemoState createState() => _AnimDemoState();
}

// State类主要负责两件事：保存数据；使用数据更新和构建UI
class _AnimDemoState extends State<AnimDemo> {
  // 控件是可见还是不可见的。
  final bool _visible = true;
  Alignment alignment = const Alignment(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimDemo'),
      ),
      body: Center(
        child: buildOpacityAnim(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 一定要调用setState，这会告诉Flutter使用我们的更改重新构建UI
          setState(() {
//            _visible = !_visible;
            alignment = Alignment.center;
          });
        },
        tooltip: '切换不透明度',
        child: const Icon(Icons.flip),
      ),
    );
  }

  /// 不透明度动画
  Widget buildOpacityAnim() {
    //使用Flutter提供的不透明度动画类
    return AnimatedOpacity(
      //如果控件是可见的，动画到1.0(完全可见)。如果小部件是隐藏的，那么将其动画为0.0(不可见)。
      opacity: _visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: Container(
        width: 200.0,
        height: 200.0,
        color: Colors.teal,
      ),
    );
  }
}
