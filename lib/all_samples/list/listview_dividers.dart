import 'package:flutter/material.dart';

void main() {
 runApp(
   new MaterialApp(
     title: 'ListView带分割线',
     theme: new ThemeData(
       primarySwatch: Colors.blue, //设置全局主题
     ),
     home: new ListViewDividerDemo(),
   ),
 );
}

class ListViewDividerDemo extends StatelessWidget {
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
          'ListView带分割线',
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

  // 简单的listview带分割线
  Widget buildListItem() {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20.0),
      children: <Widget>[
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
    );
  }

  Widget buildContents(var text) {
    return Container(
      alignment: Alignment.centerLeft,
      constraints: const BoxConstraints.expand(height: 56.0),
      child: Text(text),
    );
  }
}
