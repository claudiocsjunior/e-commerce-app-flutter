import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/submodules/settings/settings_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'client_page.dart';
import 'package:flutter/material.dart';

class ClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ClientStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ClientPage()),
    ModuleRoute("/settings", module: SettingsModule()),
  ];
}
