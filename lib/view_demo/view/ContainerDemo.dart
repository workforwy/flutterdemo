import 'package:flutter/material.dart';

/// Container 容器的基本使用
void main() {
  runApp(MaterialApp(
    title: 'MaterialApp',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const ContainerDemo(),
  ));
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      //使子控件在其内部水平和垂直居中
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        constraints: BoxConstraints.expand(
          height: Theme.of(context).textTheme.displayLarge.fontSize * 1.1 + 200.0,
        ),
        width: 300.0,
        height: 200.0,
        decoration: buildBoxDecoration(),
        foregroundDecoration: buildBoxDecoration(),
        child: const Text('容器演示'),
        transform: Matrix4.rotationZ(0.1),
      ),
    );
  }

  // 注意：BoxDecoration返回的是Decoration对象
  Decoration buildBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xfffce5cd),
      //设置Border属性给容器添加边框
      border: Border.all(
        //为边框添加颜色
        color: const Color(0xff6d9eeb),
        //边框宽度
        width: 8.0,
      ),
    );
  }
}
