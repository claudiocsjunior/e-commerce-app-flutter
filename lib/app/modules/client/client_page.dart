import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-options/drawer-options.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-widget/drawer-widget.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientPage extends StatefulWidget {
  final String title;

  const ClientPage({Key? key, this.title = "ClientPage"}) : super(key: key);

  @override
  ClientPageState createState() => ClientPageState();
}

class ClientPageState extends ModularState<ClientPage, ClientStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(titulo: "E-commerce", body: Container());
  }
}
