import 'package:flutter/material.dart';

// SliverGrid 和 GridView 的对比
// 1.SliverGrid只能在有slivers属性的列表控件里面使用，GridView可以单独使用。
// 2.SliverGrid根据设置的maxCrossAxisExtent自动判断创建几列，而GridView需要协商crossAxisCount属性
// 3.SliverGrid和GridView大体功能基本一致，可以创建相同的UI效果。
void main() {
  runApp(
    MaterialApp(
      title: 'SliverGrid和GridView对比',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SliverGridVSGridView(),
    ),
  );
}

class SliverGridVSGridView extends StatelessWidget {
  const SliverGridVSGridView({Key? key}) : super(key: key);

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
        title: const Text('SliverGrid和GridView对比'),
      ),
//      body: buildSliverGridItem(),
      body: buildGridViewItem(),
    );
  }

  // 使用SliverGrid创建列表
  Widget buildSliverGridItem() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverGrid(
          // 设置grid的宽高、间距属性
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            // 可以理解为：每一个item的宽（或高）的最大值
            maxCrossAxisExtent: 100.0,
            // 行之间的间距
            mainAxisSpacing: 10.0,
            // 列之间的间距
            crossAxisSpacing: 10.0,
            // 子孩子的宽高比例，即：宽度/高度的值
            childAspectRatio: 1.0,
          ),
          // 设置每一个item的布局
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 10)],
                child: Text('grid item $index'),
              );
            },
            childCount: 30,
          ),
        )
      ],
    );
  }

  // 使用SliverGrid创建列表
  Widget buildGridViewItem() {
    return GridView.count(
      // 创建4列
      crossAxisCount: 4,
      // Axis.horizontal表示横向滑动，scrollDirection: Axis.vertical表示纵向滑动
      scrollDirection: Axis.vertical,
      // 列之间的间距
      crossAxisSpacing: 10.0,
      // 行之间的间距
      mainAxisSpacing: 10.0,
      // 默认false 是否根据子孩子的宽高自动包裹item自身
      shrinkWrap: false,
      // 子孩子的比例
      childAspectRatio: 1.0,

      // 生成30个item展示在列表中
      children: List.generate(30, (index) {
        return Container(
          alignment: Alignment.center,
          color: Colors.teal[100 * (index % 10)],
          child: Text('grid item $index'),
        );
      }),
    );
  }
}
