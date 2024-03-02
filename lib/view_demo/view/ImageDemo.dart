import 'package:flutter/material.dart';

/// TODO
void main() {
  runApp(MaterialApp(
    title: 'image使用',
    theme: ThemeData(
      primarySwatch: Colors.blue, //设置全局主题
    ),
    home: const ImageDemo(),
  ));
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('从URL地址获取图片'),
      ),
//      body: new Center(
//        child: new Image.network(//从网络加载图片
//          'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
//          scale: 2.0,
//        ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            //从本地加载图片
            image:
                DecorationImage(image: AssetImage('images/demo.png')),
          ),
        ),
      ),
    );
  }
}
