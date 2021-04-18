import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cart-sales_store.dart';

class CartSalesPage extends StatefulWidget {
  final String title;
  const CartSalesPage({Key? key, this.title = "CartSalesPage"}) : super(key: key);
  @override
  CartSalesPageState createState() => CartSalesPageState();
}
class CartSalesPageState extends ModularState<CartSalesPage, CartSalesStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}