import 'package:e_commerce_app/app/modules/login/login_module.dart';
import 'package:e_commerce_app/app/modules/register/register_module.dart';
import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:e_commerce_app/app/shared/pages/splash/splash_page.dart';
import 'package:e_commerce_app/app/shared/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton<IauthRepository>((i) => AuthRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute("/", child: (_, args) => LoginModule()),
    ModuleRoute("/", module: LoginModule()),
    ModuleRoute("/register", module: RegisterModule()),
    ModuleRoute("/home", module: HomeModule()),
  ];
}
