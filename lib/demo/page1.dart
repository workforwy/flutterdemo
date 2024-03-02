import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'flutter learning',
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text('AppBar标题  flutter learning',
                style: Theme.of(context).primaryTextTheme.bodyLarge),
          ),
          const Expanded(
              child: Center(
            child: Text('你好 世界！'),
          )),
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, this.title}) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
//      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(color: Colors.blue),
      child: Row(
        children: <Widget>[
          const IconButton(
              icon: Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
          Expanded(child: title),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: '搜索',
            onPressed: null,
          )
        ],
      ),
    );
  }
}
