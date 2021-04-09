import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'seller_store.dart';

class SellerPage extends StatefulWidget {
  final String title;
  const SellerPage({Key key, this.title = "SellerPage"}) : super(key: key);
  @override
  SellerPageState createState() => SellerPageState();
}
class SellerPageState extends ModularState<SellerPage, SellerStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(icon: Icon(Icons.logout),
              onPressed: controller.LogOut)
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}