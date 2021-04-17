import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-options/drawer-options.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-widget/drawer-widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashBoard extends StatelessWidget {
  String titulo;
  Widget body;

  DashBoard({required this.titulo, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          actions: [
            IconButton(icon: Icon(Icons.logout), onPressed: Modular
                .get<ClientStore>()
                .LogOut)
          ],
        ),
        drawer: Observer(
          builder: (_) {
            return DrawerWidget(
                name: Modular
                    .get<ClientStore>()
                    .name,
                email: Modular
                    .get<ClientStore>()
                    .email,
                child: DrawerOptions());
          },
        ),
        body: body
    );
  }
}
