import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '多种类型item的ListView的demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: ListViewMultiItemDemo(),
    ),
  );
}

/////////////////////////////////////
//// 以下是多条目的ListView的demo
/////////////////////////////////////

List<ListItem> items = List<ListItem>.generate(
  1000,
  (i) =>
      i % 6 == 0 ? HeadingItem("标题 $i") : MessageItem("子标题 $i", "子标题描述字段 $i"),
);

class ListViewMultiItemDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '多种类型item的ListView的demo',
          style: const TextStyle(fontSize: 17.0),
        ),
      ),
      body: buildListItems(),
    );
  }

  Widget buildListItems() {
    return ListView.builder(itemBuilder: (context, index) {
      final item = items[index];
      if (item is HeadingItem) {
        return ListTile(
          title: Text(
            item.heading,
            style: const TextStyle(fontSize: 25.0, color: Colors.lightBlue),
          ),
        );
      } else if (item is MessageItem) {
        return ListTile(
          title: Text(
            item.sender,
            style: TextStyle(fontSize: 15.0, color: Colors.blueAccent[100]),
          ),
          subtitle: Text(
            item.body,
            style: const TextStyle(fontSize: 15.0, color: Colors.grey),
          ),
        );
      }
    });
  }
}

// 多类型条目列表的基类
abstract class ListItem {}

// 包含显示标题的数据的ListItem
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// 包含显示主标题、副标题的ListItem
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
