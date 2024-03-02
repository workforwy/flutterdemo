import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ListTile以及子类的使用',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      home: const ListViewListTileDemo(),
    ),
  );
}

class ListViewListTileDemo extends StatelessWidget {
  const ListViewListTileDemo({Key? key}) : super(key: key);

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
          'ListTile以及子类的使用',
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

// ListTile以及子类的使用
  Widget buildListItem() {
    return ListView(
      children: <Widget>[
        // 一个有图片和文字组成的简单列表item
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('联系人'),
          subtitle: const Text('联系人简介'),
          // 右边的图标
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            print('点击了 ListTile  ==== title为：联系人');
          },
          onLongPress: () {
            print('长按了 ListTile  ==== title为：联系人');
          },
          selected: true,
        ),
        const ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('相册'),
        ),
        const ListTile(
          leading: Icon(Icons.phone),
          title: Text('电话'),
        ),
        // 单选框列表item
        CheckboxListTile(
          value: true,
          onChanged: ((bool) {
            print('点击了CheckboxListTile');
          }),
          title: const Text('相册'),
          subtitle: const Text('相册的描述'),
          selected: true,
          activeColor: Colors.teal,
        ),
        // 开关列表item
        SwitchListTile(
          value: true,
          onChanged: ((bool) {
            print('点击了SwitchListTile');
          }),
          title: const Text('相册'),
          subtitle: const Text('相册的描述..............................'
              '...................................'
              '.....................'),
          //如果subtitle文字过长，将会以三行显示
          isThreeLine: true,
          selected: true,
          activeColor: Colors.teal,
//        dense: false,
          //SwitchListTile左边的图标
          secondary: const Icon(Icons.account_circle),
        ),
        const AboutListTile(
          icon: Icon(Icons.panorama),
          //公司logo
          applicationIcon: FlutterLogo(),
          //app名称
          applicationName: '关于我们',
          //app版本号
          applicationVersion: 'V1.0.0',
          //版权信息
          applicationLegalese: '版权归XX科技有限公司所有...',
//        child: ,//关于应用名
//        aboutBoxChildren: <Widget>[],//更多信息
        ),
      ],
    );
  }
}
