import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'TabBarDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const TabBarDemo(),
  ));
}

class TabBarDemo extends StatefulWidget {
  const TabBarDemo({Key? key}) : super(key: key);

  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

// 继承SingleTickerProviderStateMixin，提供单个Ticker（每个动画帧调用它的回调一次）
class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  /*
   * 在TabBar和TabBarView之间的坐标选项卡选择
   *  TabBar：质感设计控件，显示水平的一行选项卡
   *  TabBarView：可分布列表，显示与当前所选标签对应的控件
   */
  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.iconsAndText;

  @override
  void initState() {
    super.initState();

    /// 创建一个对象，用于管理TabBar和TabBarView所需的状态
    /// length：选项卡的总数，存储所有页面的列表中的元素个数
    _controller = TabController(
      vsync: this,
      length: _allPages.length,
    );
  }

  /// 释放对象使用的资源
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  /// 改变状态
  void changeDemoStyle(TabsDemoStyle style) {
    setState(() {
      _demoStyle = style;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 获取当前主题的控件前景色
    final Color iconColor = Theme.of(context).colorScheme.secondary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('可滚动的导航栏'),
        actions: <Widget>[
          PopupMenuButton<TabsDemoStyle>(
              onSelected: changeDemoStyle,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<TabsDemoStyle>>[
                    const PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.iconsAndText,
                      child: Text('图标和文本'),
                    ),
                    const PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.iconsOnly,
                      child: Text('仅图标'),
                    ),
                    const PopupMenuItem<TabsDemoStyle>(
                      value: TabsDemoStyle.textOnly,
                      child: Text('仅文本'),
                    ),
                  ]),
        ],
        bottom: TabBar(
          // 控件的选择和动画状态
          controller: _controller,
          // 标签栏是否可以水平滚动
          isScrollable: true,
          // 标签控件的列表
          tabs: _allPages.map((_Page page) {
            switch (_demoStyle) {
              case TabsDemoStyle.iconsAndText:
                return Tab(
                  text: page.text,
                  icon: Icon(page.icon),
                );
              case TabsDemoStyle.iconsOnly:
                return Tab(
                  icon: Icon(page.icon),
                );
              case TabsDemoStyle.textOnly:
                return Tab(text: page.text);
            }
          }).toList(),
        ),
      ),
      body: TabBarView(
        // 控件的选择和动画状态
        controller: _controller,
        // 每个标签一个控件
        children: _allPages.map(
          (_Page page) {
            return Container(
              key: ObjectKey(page.icon),
              padding: const EdgeInsets.all(12.0),
              // 质感设计卡片
              child: Card(
                child: Center(
                  child: Icon(
                    page.icon,
                    color: iconColor,
                    size: 128.0,
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

enum TabsDemoStyle { iconsAndText, iconsOnly, textOnly }

/*
 * 封装页面实体类
 *  图标
 *  文本
 */
class _Page {
  _Page({
    this.icon,
    this.text,
  });

  final IconData icon;
  final String text;
}

// 存储所有页面的列表数据源
final List<_Page> _allPages = <_Page>[
  _Page(icon: Icons.event, text: 'EVENT'),
  _Page(icon: Icons.home, text: 'HOME'),
  _Page(icon: Icons.android, text: 'ANDROID'),
  _Page(icon: Icons.alarm, text: 'ALARM'),
  _Page(icon: Icons.face, text: 'FACE'),
  _Page(icon: Icons.language, text: 'LANGUAGE'),
];
