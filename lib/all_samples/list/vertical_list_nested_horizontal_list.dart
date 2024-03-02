import 'package:flutter/material.dart';

// 垂直listview嵌套水平的listview
class ListViewNestedDemo extends StatelessWidget {
  const ListViewNestedDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '垂直listview嵌套水平的listview Demo',
      // Text(
      //   '垂直listview嵌套水平的listview Demo',
      //   style: TextStyle(fontSize: 15.0),
      // ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewNested(),
    );
  }
}

class ListViewNested extends StatelessWidget {
  const ListViewNested({Key? key}) : super(key: key);

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
          '垂直listview嵌套水平的listview Demo',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
    )

//      body: buildListView(),
    body
    :
    buildListView2
    (
    )
    ,
    )
  }

  // ListView -> SizedBox -> ListView -> 然后就是具体的组件
  Widget buildListView() {
    return ListView(
      children: [
        SizedBox(
          height: 100.0,
          child: ListView(
            // 设置滑动方向是水平方向
            scrollDirection: Axis.horizontal,
            children: const <Widget>[
              FlutterLogo(colors: Colors.pink, size: 100),
              FlutterLogo(colors: Colors.teal, size: 100),
              FlutterLogo(colors: Colors.brown, size: 100),
              FlutterLogo(colors: Colors.lightBlue, size: 100),
              FlutterLogo(colors: Colors.green, size: 100),
              FlutterLogo(colors: Colors.pink, size: 100),
              FlutterLogo(colors: Colors.teal, size: 100),
              FlutterLogo(colors: Colors.brown, size: 100),
              FlutterLogo(colors: Colors.lightBlue, size: 100),
              FlutterLogo(colors: Colors.green, size: 100),
            ],
          ),
        ),
        const FlutterLogo(colors: Colors.pink, size: 100),
        const FlutterLogo(colors: Colors.teal, size: 100),
        const FlutterLogo(colors: Colors.brown, size: 100),
        const FlutterLogo(colors: Colors.lightBlue, size: 100),
        const FlutterLogo(colors: Colors.green, size: 100),
        const FlutterLogo(colors: Colors.pink, size: 100),
        const FlutterLogo(colors: Colors.teal, size: 100),
        const FlutterLogo(colors: Colors.brown, size: 100),
        const FlutterLogo(colors: Colors.lightBlue, size: 100),
        const FlutterLogo(colors: Colors.green, size: 100),
      ],
    );
  }


  // ListView -> SizedBox -> SingleChildScrollView -> Row -> 然后就是具体的组件
  Widget buildListView2() {
    // 纵向滑动的listview
    return ListView(
      children: const [
        SizedBox(
          height: 100.0,
          child: SingleChildScrollView(
            // 设置滑动方向是水平方向
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                FlutterLogo(colors: Colors.pink, size: 100),
                FlutterLogo(colors: Colors.teal, size: 100),
                FlutterLogo(colors: Colors.brown, size: 100),
                FlutterLogo(colors: Colors.lightBlue, size: 100),
                FlutterLogo(colors: Colors.green, size: 100),
                FlutterLogo(colors: Colors.pink, size: 100),
                FlutterLogo(colors: Colors.teal, size: 100),
                FlutterLogo(colors: Colors.brown, size: 100),
                FlutterLogo(colors: Colors.lightBlue, size: 100),
                FlutterLogo(colors: Colors.green, size: 100),
              ],
            ),
          ),
        ),
        FlutterLogo(colors: Colors.pink, size: 100),
        FlutterLogo(colors: Colors.teal, size: 100),
        FlutterLogo(colors: Colors.brown, size: 100),
        FlutterLogo(colors: Colors.lightBlue, size: 100),
        FlutterLogo(colors: Colors.green, size: 100),
        FlutterLogo(colors: Colors.pink, size: 100),
        FlutterLogo(colors: Colors.teal, size: 100),
        FlutterLogo(colors: Colors.brown, size: 100),
        FlutterLogo(colors: Colors.lightBlue, size: 100),
        FlutterLogo(colors: Colors.green, size: 100),
      ],
    );
  }
}
