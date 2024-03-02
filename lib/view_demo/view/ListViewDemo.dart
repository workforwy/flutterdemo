import 'package:flutter/material.dart';

/// TODO
void main() {
  runApp(MaterialApp(
    title: 'ListViewDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const ListViewDemo(),
  ));
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListViewDemo'),
      ),
      body: ListView(
        children: const <Widget>[
          Center(
            child: Text(
              '\nListView Introduction',
              style: TextStyle(
                fontFamily: 'serif',
                fontSize: 26.0,
              ),
            ),
          ),
          Center(
              child: Text(
            '这是文字内容，看看效果如何？\n ListView is the most commonly used scrolling widget.It displays its children one after another in the scroll direction.In the cross axis, the children are required to fill the ListView.If non-null, the itemExtent forces the children to have the given extent in the scroll direction. Specifying an itemExtent is more efficient than letting the children determine their own extent because the scrolling machinery can make use of the foreknowledge of the children\'s extent to save work, for example when the scroll position changes drastically.',
            style: TextStyle(
              fontFamily: 'Monospace',
              fontSize: 20.0,
            ),
          )),
        ],
      ),
    );
  }
}
