import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SimpleDialogDemo extends StatefulWidget {
  const SimpleDialogDemo({Key? key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SimpleDialogDemo',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          buildContents(context, 'SimpleDialog Demo1', 'SimpleDialog Demo1', 1),
          buildContents(context, 'SimpleDialog Demo2', 'SimpleDialog Demo2', 2),
          buildContents(context, 'SimpleDialog Demo3', 'SimpleDialog Demo3', 3),
        ],
      ),
    );
  }
}

// 主体内容
Widget buildContents(
    BuildContext context, String contents, String title, int type) {
  return InkWell(
    // 给每一个item一个点击事件
    child:
        _buildListItemContent(contents: contents, bgColor: (Colors.teal[300])!),
    onTap: () {
      print("onTap");
      _showToast('onTap');
      // 点击了item 就会打开 SimpleDialog
      buildDialogs(context, title, type);
    },
  );
}

// ListView的 Item布局内容
Widget _buildListItemContent({var contents, required Color bgColor}) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(5.0),
    alignment: Alignment.center,
    constraints: const BoxConstraints.expand(height: 40.0),
    decoration: BoxDecoration(
      color: bgColor ?? Colors.teal[300],
      borderRadius: const BorderRadius.all(
        //让矩形四个角都变成圆角
        Radius.circular(8.0),
      ),
      // 阴影
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: (Colors.teal[100])!,
          offset: const Offset(0.0, 5.0),
          blurRadius: 8.0,
        ),
        const BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 6.0),
          blurRadius: 8.0,
        ),
      ],
    ),
    child: _buildButton(contents),
  );
}

Widget _buildButton(var contents) {
  return Text(
    contents,
    style: const TextStyle(
      color: Colors.white,
      fontSize: 16.0,
    ),
  );
}

// 创建 SimpleDialog
// 这个不能直接写，正确的使用方式：showDialog<Null>(builder: (BuildContext context) {});
// 在builder里面去声明dialog对象
void buildDialogs(BuildContext context, String title, int type) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return showSimpleDialog(context, title, type);
    },
  );
}

// 创建 SimpleDialog
// title是SimpleDialog的标题  type是dialog item创建不同的内容
SimpleDialog showSimpleDialog(BuildContext context, String title, int type) {
  Text text = Text(
    title,
    style: type == 1
        ? (TextStyle(color: Theme.of(context).primaryColor))
        : (const TextStyle(color: Colors.deepOrange)),
  );
  SimpleDialog simpleDialog = SimpleDialog(
    title: text,
    children: buildDialogItems(type, context),
  );
  return simpleDialog;
}

// 3种不同的内容，所以这里定义了3种类型
List<Widget> buildDialogItems(int type, BuildContext context) {
  List<Widget> list = <Widget>[];
  // 第一种类型 简单的ListView
  if (type == 1) {
    list = <Widget>[
      showDialogItemsClick(const Text('item1'), 'item1', context),
      showDialogItemsClick(const Text('item2'), 'item2', context),
      showDialogItemsClick(const Text('item3'), 'item3', context),
      showDialogItemsClick(const Text('item4'), 'item4', context),
      showDialogItemsClick(const Text('item5'), 'item5', context),
    ];
  } else if (type == 2) {
    list = <Widget>[
      showDialogItemsClick(
          _buildListItemContent(
              contents: 'item1', bgColor: (Colors.teal[300])!),
          'item1',
          context),
      showDialogItemsClick(
          _buildListItemContent(
              contents: 'item2', bgColor: (Colors.teal[300])!),
          'item2',
          context),
      showDialogItemsClick(
          _buildListItemContent(
              contents: 'item3', bgColor: (Colors.teal[300])!),
          'item3',
          context),
      showDialogItemsClick(
          _buildListItemContent(
              contents: 'item4', bgColor: (Colors.teal[300])!),
          'item4',
          context),
      showDialogItemsClick(
          _buildListItemContent(
              contents: 'item5', bgColor: (Colors.teal[300])!),
          'item5',
          context),
    ];
  } else if (type == 3) {
    list = <Widget>[
      showDialogItemsClick(
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.redAccent,
            ),
            title: Text(
              '相册',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          '相册',
          context),
      showDialogItemsClick(
          const ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.redAccent,
            ),
            title: Text(
              '添加',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          '添加',
          context),
      showDialogItemsClick(
          const ListTile(
            leading: Icon(
              Icons.mic,
              color: Colors.redAccent,
            ),
            title: Text(
              '录音',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          '录音',
          context),
      showDialogItemsClick(
          const ListTile(
            leading: Icon(
              Icons.mail,
              color: Colors.redAccent,
            ),
            title: Text(
              '邮件',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          '邮件',
          context),
      showDialogItemsClick(
          const ListTile(
            leading: Icon(
              Icons.search,
              color: Colors.redAccent,
            ),
            title: Text(
              '搜索',
              style: TextStyle(color: Colors.deepOrangeAccent),
            ),
          ),
          '搜索',
          context),
    ];
  }
  return list;
}

// 点击弹窗里面的每一个item时的事件
// 参数1：要点击的item  参数2：toast的内容
Widget showDialogItemsClick(Widget child, String msg, BuildContext context) {
  return InkWell(
    child: child,
    onTap: () {
      Navigator.pop(context);
      _showToast("关闭了Dialog" + msg);
    },
  );
}

void _showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM);
}
