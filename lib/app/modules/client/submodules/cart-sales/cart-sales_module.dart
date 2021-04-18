import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_page.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class CartSalesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartSalesStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CartSalesPage()),
  ];
}
