import 'package:e_commerce_app/app/modules/register/register_page.dart';
import 'package:e_commerce_app/app/modules/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_store.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage()),
  ];
}
