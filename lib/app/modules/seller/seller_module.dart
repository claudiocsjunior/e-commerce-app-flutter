import 'package:e_commerce_app/app/modules/seller/seller_page.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SellerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SellerStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SellerPage()),
  ];
}
