import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: '多级列表Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: ListViewMultiLevelDemo(),
    ),
  );
}

class ListViewMultiLevelDemo extends StatelessWidget {
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
          '多级列表Demo',
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

  // 自定义可折叠的列表
  Widget buildListItem() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

/////////////////////////////////////
//// 以下是可折叠展开的多级列表
/////////////////////////////////////
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(title: Text(root.title)); //这个只是显示一个标题
    }
    return ExpansionTile(
      //这个可以展开折叠视图
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }
}

/// 应用程序显示的整个多级列表
final List<Entry> data = <Entry>[
  Entry(
    'Chapter 1',
    <Entry>[
      Entry(
        '    Section 1-1',
        <Entry>[
          Entry('      Item 1-1-1'),
          Entry('      Item 1-1-2'),
          Entry('      Item 1-1-3'),
        ],
      ),
      Entry('    Section 1-2'),
      Entry('    Section 1-3'),
    ],
  ),
  Entry(
    'Chapter 2',
    <Entry>[
      Entry('    Section 2-1'),
      Entry('    Section 2-2'),
    ],
  ),
  Entry(
    'Chapter 3',
    <Entry>[
      Entry('    Section 3-1'),
      Entry('    Section 3-2'),
      Entry(
        '    Section 3-3',
        <Entry>[
          Entry('        Item 3-3-1'),
          Entry('        Item 3-3-2'),
          Entry('        Item 3-3-3'),
          Entry('        Item 3-3-4'),
        ],
      ),
    ],
  ),
];

/// 应用程序显示的多级列表中的一个条目
class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
