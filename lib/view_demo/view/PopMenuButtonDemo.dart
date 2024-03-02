import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// TODO
void main() {
  runApp(MaterialApp(
    title: 'PopMenuButtonDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const PopMenuButtonDemo(),
  ));
}

class PopMenuButtonDemo extends StatefulWidget {
  const PopMenuButtonDemo({Key? key}) : super(key: key);

  @override
  _PopMenuButtonDemoState createState() => _PopMenuButtonDemoState();
}

class _PopMenuButtonDemoState extends State<PopMenuButtonDemo> {
  String _bodyStr = '显示菜单的点击';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PopMenuButtonDemo'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) => list(),
            tooltip: "提示",
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            onSelected: (String value) {
              setState(() {
                _bodyStr = value;
                //弹吐司
                Fluttertoast.showToast(
                  msg: "点击了： $value",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                );
              });
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          _bodyStr,
          style: TextStyle(
            color: Colors.red[500],
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

List<PopupMenuItem<String>> list() {
  List<PopupMenuItem<String>> list = <PopupMenuItem<String>>[
    const PopupMenuItem<String>(value: '选项一', child: Text('选项一')),
    const PopupMenuItem<String>(value: '选项二', child: Text('选项二')),
  ];
  return list;
}
