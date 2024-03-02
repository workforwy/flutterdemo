import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CustomScrollView创建一个列表',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: const ListViewGridViewDemo(),
    ),
  );
}

class ListViewGridViewDemo extends StatelessWidget {
  const ListViewGridViewDemo({Key? key}) : super(key: key);

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
          '创建GridView列表',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildGridListItem(context)),
    );
  }

// grid列表
  Widget buildGridListItem(BuildContext context) {
    return GridView.count(
      // 创建4列
      crossAxisCount: 4,
      // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
      scrollDirection: Axis.vertical,
      // 列之间的间距
      crossAxisSpacing: 5.0,
      // 行之间的间距
      mainAxisSpacing: 5.0,
      // 默认false 是否根据子孩子的宽高自动包裹item自身
      shrinkWrap: false,
      // true表示数据倒序排列 false表示顺序排列
      // reverse: true,
      // 子孩子的比例
      childAspectRatio: 2.0,

      // 生成100个item展示在列表中
      children: List.generate(100, (index) {
        return Container(
          // margin外边距，这里是上边距为2.0像素，下边距为2.0像素
          // margin: new EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 2.0),
          decoration: const BoxDecoration(color: Colors.teal),
          child: buildGridItem(context, index),
        );
      }),
    );
  }

  Widget buildGridItem(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        const Icon(
          Icons.share,
          color: Colors.white,
        ),
        Text(
          'Item $index',
          style: const TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
