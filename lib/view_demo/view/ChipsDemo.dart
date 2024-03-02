import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'main3',
      theme: ThemeData(
        primarySwatch: Colors.blue, //蓝色主题
      ),
      //主要内容是什么。。。
      home: const ChipsDemo(),
    );
  }
}

class ChipsDemo extends StatelessWidget {
  const ChipsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('标题'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          buildChoiceChip(),
          buildActionChip(),
          buildFilterChip(),
          buildChip(),
          buildInputChip(),
          buildRawChip(),
        ],
      ),
    );
  }
}

Widget buildChoiceChip() {
  return ChoiceChip(
    label: const SizedBox(
      width: 130.0,
      child: Row(
        children: <Widget>[
          Text(
            'ChoiceChip示例',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 5.0,
          ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 10.0,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 10.0,
            ),
          ),
        ],
      ),
    ),
//    labelStyle: new TextStyle(color: Colors.white),
    avatar: const CircleAvatar(
      backgroundColor: Colors.deepOrange,
      child: Text('哈'),
    ),
    selected: true,
    onSelected: (bool) {
      print('点击了ChoiceChip');
    },
    selectedColor: Colors.blue,
  );
}

Widget buildActionChip() {
  return ActionChip(
      label: const Text('ActionChip示例'),
      avatar: const CircleAvatar(
        backgroundColor: Colors.deepPurpleAccent,
        child: Text('哈'),
      ),
      onPressed: () {
        print('选择了XXX');
      });
}

Widget buildFilterChip() {
  return FilterChip(
      label: const Text('FilterChip示例'),
      avatar: const CircleAvatar(
        backgroundColor: Colors.lime,
        child: Text('哈'),
      ),
      onSelected: (bool) {
        print(bool);
      });
}

Widget buildChip() {
  return const Chip(
    label: Text('Chip示例'),
    avatar: CircleAvatar(
      backgroundColor: Colors.teal,
      child: Text('哈哈'),
    ),
  );
}

Widget buildInputChip() {
  return const InputChip(
    label: Text('InputChip示例'),
    avatar: CircleAvatar(
      backgroundColor: Colors.tealAccent,
      child: Text('哈'),
    ),
  );
}

Widget buildRawChip() {
  return const RawChip(
    label: Text('RawChip示例'),
    avatar: CircleAvatar(
      backgroundColor: Colors.pinkAccent,
      child: Text('哈'),
    ),
  );
}
