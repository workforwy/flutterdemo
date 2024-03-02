import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SnackBarDemo extends StatefulWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SnackBarDemo',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: setBuilders(context),
    );
  }
}

Widget setBuilders(BuildContext context) {
  // 如果去掉new Builder ，那么SnackBar不会显示
  return Builder(builder: (BuildContext context) {
    // 必须加上return 不加就报错
    return buildClicks(buildContents('显示SnackBar'), context);
  });
}

Widget buildClicks(Widget child, BuildContext context) {
  return InkWell(
    child: child,
    onTapDown: (details) {
      Fluttertoast.showToast(
          msg: 'onTapDown',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

      final snackBar = SnackBar(
        // SnackBar的主体内容
        content: const Text(
          '这是一个SnackBar',
          style: TextStyle(color: Colors.white),
        ),
        // 显示的时间，默认是1.5s 我这里设置的是5秒
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.deepOrangeAccent,
        // 交互动作，可以在这里写，我这里写的是关闭SnackBar的操作
        action: SnackBarAction(
          // label的颜色跟主题色有关
          label: '取消',
          onPressed: () {
            Fluttertoast.showToast(
                msg: '关闭了SnackBar',
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER);
          },
        ),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    },
    onTap: () {
      Fluttertoast.showToast(
          msg: 'onTap',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
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
