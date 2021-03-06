import 'package:e_commerce_app/app/modules/client/submodules/settings/settings_page.dart';
import 'package:e_commerce_app/app/modules/client/submodules/settings/settings_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SettingsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsPage()),
  ];
}
