import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'ProgressDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const ProgressDemo(),
  ));
}

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({Key? key}) : super(key: key);

  @override
  ProgressDemoState createState() {
    return ProgressDemoState(
        maximumEmergy: 100,
        maximumHunger: 100,
        maximumMood: 100,
        currentEmergy: 80,
        currentHunger: 90,
        currentMood: 75);
  }
}

class ProgressDemoState extends State<ProgressDemo> {
  /*
   * 构建函数，传递参数
   *  最大能量值
   *  最大饥饿值
   *  最大情绪值
   *  当前能量值
   *  当前饥饿值
   *  当前情绪值
   */
  ProgressDemoState({
    this.maximumEmergy,
    this.maximumHunger,
    this.maximumMood,
    this.currentEmergy,
    this.currentHunger,
    this.currentMood,
  });

  int maximumEmergy;
  int maximumHunger;
  int maximumMood;
  int currentEmergy;
  int currentHunger;
  int currentMood;

  // 获取进度条描述文本
  Align _getNameText(BuildContext context, String text) {
    return Align(
        alignment: FractionalOffset.topLeft,
        child: Text(text,
            style: const TextStyle(
              fontSize: 15.0,
              color: Colors.red,
              height: 1.5,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProgressDemo'),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(17.0, 0.0, 17.0, 10.0),
        child: Column(
          children: <Widget>[
            _getNameText(context, '能量（$currentEmergy/$maximumEmergy）'),
            LinearProgressIndicator(value: currentEmergy / maximumEmergy),
            _getNameText(context, '饥饿（$currentHunger/$maximumHunger）'),
            LinearProgressIndicator(value: currentHunger / maximumHunger),
            _getNameText(context, '心情（$currentMood/$maximumMood）'),
            LinearProgressIndicator(value: currentMood / maximumMood),
          ],
        ),
      ),
    );
  }
}
