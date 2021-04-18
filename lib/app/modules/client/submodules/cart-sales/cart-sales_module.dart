import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_page.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class CartSalesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CartSalesStore(i.get<ISaleRepository>(), i.get<IProductRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CartSalesPage()),
  ];
}
