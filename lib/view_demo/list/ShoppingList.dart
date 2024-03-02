import 'package:flutter/material.dart';
import 'ShoppingListItem.dart';

/// ListView 购物清单 demo
void main() {
  runApp(
    MaterialApp(
      title: 'Flutter教程',
      home: ShoppingList(products: _kProducts),
    ),
  );
}

// 创建Products集合
final List<Product> _kProducts = <Product>[
  const Product(name: '番茄'),
  const Product(name: '辣椒'),
  const Product(name: '茄子'),
  const Product(name: '芥蓝'),
  const Product(name: '黄瓜'),
  const Product(name: '白菜'),
  const Product(name: '西蓝花'),
  const Product(name: '韭菜'),
  const Product(name: '莲藕'),
  const Product(name: '西芹'),
  const Product(name: '土豆'),
  const Product(name: '冬瓜'),
  const Product(name: '胡瓜'),
  const Product(name: '豇豆'),
  const Product(name: '四季豆'),
  const Product(name: '红萝卜'),
  const Product(name: '白萝卜'),
  const Product(name: '胡萝卜'),
  const Product(name: '豆腐'),
  const Product(name: '山药'),
  const Product(name: '洋葱'),
  const Product(name: '豆芽'),
  const Product(name: '金针菇'),
  const Product(name: '香菇'),
];

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key key, this.products}) : super(key: key);
  final List<Product> products;

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final Set<Product> _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('购物清单'),
        leading: const IconButton(
            icon: Icon(Icons.menu), tooltip: '导航菜单', onPressed: null),
      ),
      body: ListView(
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            //监听
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}
