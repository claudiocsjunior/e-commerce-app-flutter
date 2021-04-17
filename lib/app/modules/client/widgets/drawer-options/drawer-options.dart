import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Inicio"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: Modular.get<ClientStore>().toHomePage
        ),
        ListTile(
          leading: Icon(Icons.category_rounded),
          title: Text("Categorias"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text("Meu carrinho"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text("Minhas compras"),
          trailing: Icon(Icons.keyboard_arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Configurações"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: Modular.get<ClientStore>().toSettings
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Sair"),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: Modular.get<ClientStore>().LogOut
        )
      ],
    );
  }
}
