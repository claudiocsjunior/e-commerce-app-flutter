import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientPage extends StatefulWidget {
  final String title;
  const ClientPage({Key key, this.title = "ClientPage"}) : super(key: key);
  @override
  ClientPageState createState() => ClientPageState();
}
class ClientPageState extends ModularState<ClientPage, ClientStore> {
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