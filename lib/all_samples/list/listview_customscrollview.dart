import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'CustomScrollView创建一个列表',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: ListViewCustomScrollViewDemo(),
    ),
  );
}

class ListViewCustomScrollViewDemo extends StatelessWidget {
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
          'CustomScrollView创建一个列表',
          style: const TextStyle(fontSize: 17.0),
        ),
      ),
      body: GestureDetector(
          onTap: () {
            print('点击了item！');
          },
          child: buildListItem()),
    );
  }

  // 使用CustomScrollView创建一个列表
  Widget buildListItem() {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                buildContents('item1'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item2'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item3'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item4'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item4'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item5'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item6'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item7'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item8'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item9'),
                const Divider(height: 1.0, color: Colors.grey),
                buildContents('item10'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildContents(var text) {
  return Container(
    alignment: Alignment.centerLeft,
    constraints: const BoxConstraints.expand(height: 56.0),
    child: Text(text),
  );
}
