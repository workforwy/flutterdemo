import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'simple_dialog_demo.dart';
import 'snackbar_demo.dart';

class AlertDialogDemo extends StatelessWidget {
  const AlertDialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = <Widget>[
      buildClicks(buildContents('SnackBar的使用'), context, const SnackBarDemo()),
      buildClicks(
          buildContents('SimpleDialog的使用'), context, const SimpleDialogDemo()),
      buildClicks(buildContents('AlertDialog的使用'), context, const AlertDialogDemo()),
      //      buildClicks(buildContents('BottomSheet的使用'), context, new SnackBarDemo()),
      //      buildClicks(
      //          buildContents('ExpansionPanel的使用'), context, new SnackBarDemo()),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              // 返回上一个页面
              Navigator.of(context).pop();
            }),
        title: const Text('各种弹窗&提示控件用法'),
      ),
      body: ListView(children: widgets),
    );
  }

  Widget buildClicks(Widget child, BuildContext context, Widget page) {
    return InkWell(
      child: child,
      onTapDown: (details) {
        print('onTapDown');
        Fluttertoast.showToast(
            msg: 'onTapDown',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
        // 发送路由消息
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => page));
      },
      onTap: () {
        Fluttertoast.showToast(
            msg: 'onTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onLongPress: () {
        Fluttertoast.showToast(
            msg: 'onLongPress',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
      onDoubleTap: () {
        Fluttertoast.showToast(
            msg: 'onDoubleTap',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      },
    );
  }

  Widget buildContents(var text) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(height: 40.0),
      decoration: BoxDecoration(
        color: Colors.teal[300],
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
      child: buildButton(text),
    );
  }

  Widget buildButton(var text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16.0,
      ),
    );
  }
}
