import 'package:flutter/material.dart';

/// 实现一个MD风格的简单界面，包括有：AppBar + FloatingActionButton + Drawer
/// Drawer只是简单的写了一个Text，并没有写具体内容，后续会详细介绍
void main() {
  runApp(MaterialApp(
    title: 'MaterialApp',
    theme: ThemeData(
      primaryColor: Colors.red, //设置appbar主题
      primarySwatch: Colors.deepOrange, //设置全局主题
    ),
    home: const MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
            icon: Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
        title: const Text('这是标题'),
        actions: const <Widget>[
          IconButton(
              icon: Icon(Icons.search), tooltip: '搜索', onPressed: null),
          IconButton(
              icon: Icon(Icons.add), tooltip: '添加', onPressed: null),
          IconButton(
              icon: Icon(Icons.edit), tooltip: '编辑', onPressed: null),
        ],
      ),
      body: const Center(
        child: Text('这是内容区域。。'),
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'FloatingActionButton',
        onPressed: null,
      ),
      drawer: const Drawer(
        child: Text('Drawer'),
        semanticLabel: '这是 Drawer',
      ),
    );
  }
}
