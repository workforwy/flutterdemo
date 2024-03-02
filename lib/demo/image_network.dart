import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

void main() => runApp(const ImageAndNetWorkDemo());

class ImageAndNetWorkDemo extends StatelessWidget {
  const ImageAndNetWorkDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageAndNetWorkDemo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ImageAndNetWorkDemo'),
        ),
        body: useNetWorkImage(),

        /// 加载网络图片
//        body:useAssetImage(),/// 加载本地图片
      ),
    );
  }
}

/// 加载网络图片
Center useNetWorkImage() {
  return Center(
    /// Dart2的写法，可以省去new关键字
    child: Image.network(
      'http://pic.baike.soso.com/p/20130828/20130828161137-1346445960.jpg',
      scale: 2.0,
    ),
  );
}

/// 加载本地图片
Center useAssetImage() {
  return Center(
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/ic_launcher.png'),
        ),
      ),
    ),
  );
}

/// 通过网络加载json并解析层对象
void _networkLoading() {
  /// 访问快递接口
  /// 将给定标头的HTTP GET请求发送到给定的URL，并注册回调，参数为HTTP响应
  http
      .get(Uri.parse('http://www.kuaidi100.com/query?type=yuantong&postid=11111111111'))
      .then((http.Response response) {
    // 响应的主体作为字符串返回
    String netdata = response.body;
    // JsonDecoder类解析JSON字符串并构建相应的对象
    JsonDecoder decoder = const JsonDecoder();
    // 将给定的JSON字符串输入转换为其对应的对象
    Map<String, dynamic> json = decoder.convert(netdata);
    // 输出给定的JSON数据
    Log('networkLoading').d(json.toString());
  });
}

/// 以下是异步加载本地json资源
Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/result.json');
}

void _loadJson() {
  loadAsset().then((value) {
    JsonDecoder decoder = const JsonDecoder();
    Map<String, dynamic> json = decoder.convert(value);
    Log('_loadJson').d(json.toString());
  });
}
