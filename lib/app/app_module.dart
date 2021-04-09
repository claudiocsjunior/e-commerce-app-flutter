import 'package:e_commerce_app/app/shared/pages/home/home_page.dart';
import 'package:e_commerce_app/app/shared/pages/home/home_store.dart';
import 'package:e_commerce_app/app/modules/login/login_module.dart';
import 'package:e_commerce_app/app/modules/register/register_module.dart';
import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/guards/auth-guard.dart';
import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:e_commerce_app/app/shared/pages/splash/splash_page.dart';
import 'package:e_commerce_app/app/shared/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:e_commerce_app/app/modules/seller/seller_module.dart';
import 'package:e_commerce_app/app/modules/client/client_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton<IauthRepository>((i) => AuthRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => SplashPage()),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/register", module: RegisterModule()),
    ChildRoute("/home", child: (_, args) => HomePage(), guards: [AuthGuard()]),
    ModuleRoute("/seller", module: SellerModule(), guards: [AuthGuard()]),
    ModuleRoute("/client", module: ClientModule(), guards: [AuthGuard()]),
  ];
}
