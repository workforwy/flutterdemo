import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ListView.builder构建长列表',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home:  ListViewLongListDemo(),
    ),
  );
}

class ListViewLongListDemo extends StatelessWidget {
   ListViewLongListDemo({Key? key}) : super(key: key);

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
          'ListView.builder构建长列表',
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

  // 长文本
  final items = List<String>.generate(10000, (i) => "Item $i");

  // 通过ListView.builder 构建一个长列表
  Widget buildListItem() {
    return ListView.builder(
//      padding: new EdgeInsets.all(8.0),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
//          title: new Text('${items[index]}'),//不加分割线
          title: buildItems(context, index), //添加分割线
        );
      },
    );
  }

  Widget buildItems(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(items[index]),
        ),
        Divider(height: 1.0, indent: 0.0, color: Theme.of(context).colorScheme.secondary),
      ],
    );
  }
}
