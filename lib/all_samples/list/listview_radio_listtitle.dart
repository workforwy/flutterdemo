import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ListView的RadioListTile的切换',
      theme: ThemeData(
        primarySwatch: Colors.blue, //设置全局主题
      ),
      //动态演示RadioListTile的切换
      home: const RadioListTileDemo(),
    ),
  );
}

// RadioListTile的示范代码
class RadioListTileDemo extends StatefulWidget {
  const RadioListTileDemo({Key? key}) : super(key: key);

  @override
  _RadioListTileDemoState createState() => _RadioListTileDemoState();
}

class _RadioListTileDemoState extends State<RadioListTileDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView的RadioListTile的切换',
          style: TextStyle(fontSize: 17.0),
        ),
      ),
      body: items(),
    );
  }

  // 示例来源于源码
  Widget items() {
    return Column(
      // In the build function of that State
      children: <Widget>[
        RadioListTile<SingingCharacter>(
          title: const Text('item title1'),
          value: SingingCharacter.title1,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
        RadioListTile<SingingCharacter>(
          title: const Text('item title2'),
          value: SingingCharacter.title2,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
            });
          },
        ),
      ],
    );
  }
}

// In the State of a stateful widget:
SingingCharacter _character = SingingCharacter.title1;

enum SingingCharacter { title1, title2 }
