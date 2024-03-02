import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Gesture Demo';

    return const MaterialApp(
      title: title,
      home: MyHomePage(title: title),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: MyButton()),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 使用 GestureDetector 包裹没有点击事件的控件
    return GestureDetector(
      // 当孩子控件被轻击时，显示snackbar
      onTap: () {
        const snackBar = SnackBar(content: Text("Tap"));

        Scaffold.of(context).showSnackBar(snackBar);
      },
      // 自定义的Button
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('My Button'),
      ),
    );
  }
}

/// 我们希望在点击时将ripple动画添加到widget中。Flutter提供了InkWell小部件来实现这一效果。
/// 创建一个
class MyButton2 extends StatelessWidget {
  const MyButton2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 创建一个我们想要点击的小部件,将它封装在InkWell小部件中，以管理tap回调和纹波动画
    return InkWell(
      // 当我们轻击按钮时，显示snackbar
      onTap: () {
      	 const snackBar = SnackBar(content: Text("Tap"));
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
         padding: const EdgeInsets.all(12.0),
         decoration: BoxDecoration(
         color: Theme.of(context).buttonColor,
         borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Text('Material Design Ripple Button'),
      ),
    );
  }
}