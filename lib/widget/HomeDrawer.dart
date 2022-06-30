/*
 * @Description: 
 * @Autor: wy
 * @Date: 2020-12-02 15:06:35
 * @LastEditors: 
 * @LastEditTime: 2021-03-02 10:57:22
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeDrawer();
  }
}

class _HomeDrawer extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    //一个控制面板可以水平的从边上划入，用来展示一些导航信息，即抽屉
    return Drawer(
      //抽屉的占比
      elevation: 14,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("电影App"),
          elevation: 50,
        ),
        body: const Text("Drawer"),
      ),
    );
  }
}
