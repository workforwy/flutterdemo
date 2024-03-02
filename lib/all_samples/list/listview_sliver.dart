import 'package:flutter/material.dart';

//void main() {
//  runApp(
//    new MaterialApp(
//      title: '可折叠的AppBar+ListView',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue, //设置全局主题
//      ),
//      home: new ListViewSliverDemo(),
//    ),
//  );
//}

class ListViewSliverDemo extends StatelessWidget {
  const ListViewSliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildListItem(context));
  }

  Widget buildListItem(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          // 返回按钮
          leading: IconButton(
              icon: const Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                // 返回上一个页面
                Navigator.of(context).pop();
              }),
          // 标题
          title: const Text(
            '可折叠的appbar + listview',
            style: TextStyle(
              fontSize: 17.0,
            ),
          ),
          // 右边的按钮
          actions: const <Widget>[
            Icon(Icons.search),
            Icon(Icons.add),
            Icon(Icons.menu),
          ],
          backgroundColor: Colors.lime,
          automaticallyImplyLeading: false,
          // 相当于安卓里面的fitSystem属性
          primary: true,
          pinned: true,
          floating: true,
          snap: false,
          expandedHeight: 300.0,
          // 可折叠的appbar
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('Demo'),
            // 折叠布局的标题是否居中
            centerTitle: true,
            // 背景图片
            background: Image.asset(
              'images/demo.png',
              // 填充
              fit: BoxFit.fill,
            ),
          ),
        ),
        //可以折叠的Grid列表
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 8)],
                child: Text('item $index'),
              );
            },
            childCount: 8,
          ),
        ),
        // 可以折叠的List列表
        SliverFixedExtentList(
          // 可以理解为item的高度
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 10)],
                child: Text('list item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
