import 'package:flutter/material.dart';

//带交互效果的Form  + TextFormField
void main() {
  runApp(MaterialApp(
    title: 'FieldDemo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const FieldDemo(),
  ));
}

class FieldDemo extends StatefulWidget {
  const FieldDemo({Key? key}) : super(key: key);

  @override
  _FieldDemoState createState() => _FieldDemoState();
}

class _FieldDemoState extends State<FieldDemo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name;
  String _color;
  String _config;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新增商品'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //外边距
            margin: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
            //内边距
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onSaved: (val) => _name = val,
                    validator: (val) =>
                        (val == null || val.isEmpty) ? "请输入商品名称" : null,
                    decoration: const InputDecoration(
                      // border默认为UnderlineInputBorder
                      border: UnderlineInputBorder(),
                      labelText: '请输入商品名称',
                    ),
                  ),
                  TextFormField(
//                    maxLengthEnforced: true,
                    maxLength: 5, //文本长度
                    onSaved: (val) => _color = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择颜色" : null,
                    decoration: InputDecoration(
//                      设置是否有全部的边框
                      filled: true,
                      //填充颜色
                      fillColor: Colors.orangeAccent,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        //貌似borderSide属性没作用
//                        borderSide: new BorderSide(width: 10.0, color: Colors.green),
                      ),
//                      hintText: '颜色',
                      //有了labelText就不需要hintText属性了
                      labelText: '请输入颜色',
                      labelStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                  TextFormField(
                    maxLength: 32,
                    onSaved: (val) => _config = val,
                    validator: (v) => (v == null || v.isEmpty) ? "请选择配置" : null,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '请输入配置',
                    ),
                  ),
                  MaterialButton(
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _onSubmit,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 提交
  void _onSubmit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text('商品名称：$_name  \n 颜色：$_color \n 配置：$_config'),
            ),
      );
    }
  }
}
