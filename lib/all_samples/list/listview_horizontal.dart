import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '横向ListView',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: ListViewHorizontalDemo(),
    ),
  );
}

class ListViewHorizontalDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: const Text(
          '横向ListView',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildListItem()),
    );
  }

// 横向的ListView
  Widget buildListItem() {
    return ListView(
      // 水平方向排列
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        // 如果每一个item的宽度为屏幕的宽，就可以做出类似于Gallery的效果
        // 但是要控制好滑动的速度
        Container(
          width: 480.0,
          color: Colors.red,
        ),
        Container(
          width: 480.0,
          color: Colors.blue,
        ),
        Container(
          width: 480.0,
          color: Colors.green,
        ),
        Container(
          width: 480.0,
          color: Colors.yellow,
        ),
        Container(
          width: 480.0,
          color: Colors.orange,
        ),
      ],
    );
  }
}
