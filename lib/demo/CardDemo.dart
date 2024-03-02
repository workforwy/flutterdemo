import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //应用程序的唯一键值，Scaffold的状态
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController _controller;

  //局部变量，选择页面
  _Page _selectedPage;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
    //addListener：每次动画的值更改时调用侦听器
    _controller.addListener(_handleTabSelection);
    _selectedPage = _allPages[0];
  }

//处理选项卡选择的函数
  void _handleTabSelection() {
    setState(() {
      _selectedPage = _allPages[_controller.index];
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
            title: Text(widget.title),
            //bottom:显示在应用栏底部的控件
            bottom: TabBar(
                controller: _controller,
                tabs: _allPages.map((_Page page) {
                  return Tab(
                    text: page.label,
                  );
                }).toList())),
        floatingActionButton: !_selectedPage.fabDefined
            ? null
            : FloatingActionButton(
                key: _selectedPage.fabKey,
                tooltip: '显示说明',
                backgroundColor: _selectedPage.fabColor,
                child: _selectedPage.fabIcon,
                onPressed: _showExplanatoryText,
              ),
        body: TabBarView(
          controller: _controller,
          children: _allPages.map(buildTabView).toList(),
        ));
  }

  //显示说明文本的函数
  void _showExplanatoryText() {
    /*
    currentState：当前树中具有此键的控件的状态
    showBottomSheet：显示持久的质感设计底部板块
     */
    _scaffoldKey.currentState.showBottomSheet((BuildContext context) {
      return Container(
          decoration: BoxDecoration(
            //容器顶部的边界颜色为当前主题颜色
              border: Border(
                  top: BorderSide(color: Theme.of(context).dividerColor))),
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                _selectedPage.fabDefined == true ? _explanatoryText : "",
                style: TextStyle(color: _selectedPage.labelColor),
              )));
    });
    }

  Widget buildTabView(_Page page) {
    //Builder：将其构建委托给回调的控件
    return Builder(
      //builder：调用获取控件
      builder: (BuildContext context) {
        return Container(
          key: ValueKey<String>(page.label),
          padding: const EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 96.0),
          //创建质感设计卡片
          child: Card(
            child: Center(
              child: Text(
                page.label,
                style: TextStyle(
                  color: page.labelColor,
                  fontSize: 32.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

const String _explanatoryText = "当Scaffold的浮动操作按钮改变时，新按钮消失并变成视图。"
    "在这个Demo中，更改选项卡会导致应用程序与浮动操作按钮重建，"
    "Scaffold通过键值与其他区分。";

/*
页面类
成员变量：标签名称、颜色、图标
成员函数：
  获取卡片标签颜色
  获取浮动按钮定义是否为空
  获取浮动按钮的颜色
  获取浮动按钮的图标
  获取浮动按钮的键值
 */
class _Page {
  _Page({
    required  this.label,
    required this.colors,
    required this.icon,
  });

  final String label;
  final MaterialColor colors;
  final IconData icon;

  Color get labelColor => colors != null ? colors[300] : Colors.grey[300];

  bool get fabDefined => icon != null;

  Color get fabColor => colors[400];

  Icon get fabIcon => Icon(icon);

  Key get fabKey => ValueKey<Color>(fabColor);
}

//所有页面类的列表
final List<_Page> _allPages = <_Page>[
  _Page(label: '蓝色', colors: Colors.indigo, icon: Icons.add),
  _Page(label: '绿色', colors: Colors.green, icon: Icons.create),
  _Page(label: '空白'),
  _Page(label: '蓝绿色', colors: Colors.teal, icon: Icons.add),
  _Page(label: '红色', colors: Colors.red, icon: Icons.create),
];
