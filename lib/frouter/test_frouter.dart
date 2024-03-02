import 'package:flutter/material.dart';
import 'FRouter.dart';

void main() => runApp(const MainPage());

// 使用示例代码
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // 首页 isFirstPage: true,
    return FRouter(
      isFirstPage: true,
      isShowAppBar: true,
      routes: {
        // 不传递数据
        '/pageone': (builder) => const PageOne(),
        // 传递数据给PageTwo这个页面
        '/pagetwo': (builder) => PageTwo('数据2'),
        '/pagethree': (builder) => PageThree('数据3'),
      },
      appBarTitle: const Text('Hello World'),
      child: RaisedButton(
        onPressed: () {
          // 命名路由
          FRouter.sendRouter(context, '/pageone');
          // 发送路由到新页面
          // FRouter.sendRouterPage(context, PageOne('data'));
        },
        child: const Text('点击进行跳转'),
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 非首页 isFirstPage: false, 默认就是非首页
    return FRouter(
      isShowAppBar: true,
      appBarTitle: const Text('nodata'),
      child: RaisedButton(
        onPressed: () {
          // 返回到上个页面
          FRouter.backPageRouter(context);
        },
        child: const Text('点击进行跳转'),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  String data;

  PageTwo(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FRouter(
      isShowAppBar: true,
      appBarTitle: const Text('PageTwo'),
      child: RaisedButton(
        onPressed: () {
          // 返回数据给上个页面
          FRouter.backPageRouter(context);
        },
        child: const Text('点击进行跳转'),
      ),
    );
  }
}

class PageThree extends StatelessWidget {
  String data;

  PageThree(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 不显示AppBar
    return FRouter(
      isShowAppBar: false,
      child: RaisedButton(
        onPressed: () {
          FRouter.backPageRouter(context);
        },
        child: const Text('点击进行跳转'),
      ),
    );
  }
}
