import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_module.dart';
import 'package:e_commerce_app/app/modules/client/submodules/category/category_module.dart';
import 'package:e_commerce_app/app/modules/client/submodules/finalized-sales/finalized-sales_module.dart';
import 'package:e_commerce_app/app/modules/client/submodules/settings/settings_module.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/category_repository.dart';
import 'package:e_commerce_app/app/shared/repositories/product_repository.dart';
import 'package:e_commerce_app/app/shared/repositories/sale_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'client_page.dart';
import 'package:flutter/material.dart';

class ClientModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ICategoryRepository>((i) => CategoryRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton<IProductRepository>((i) => ProductRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton<ISaleRepository>((i) => SaleRepository(FirebaseFirestore.instance, i.get<IProductRepository>(), i.get<ICategoryRepository>())),
    Bind.lazySingleton((i) => ClientStore(i.get<ICategoryRepository>(), i.get<IProductRepository>(), i.get<ISaleRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ClientPage()),
    ModuleRoute("/settings", module: SettingsModule()),
    ModuleRoute("/category", module: CategoryModule()),
    ModuleRoute("/cartSales", module: CartSalesModule()),
    ModuleRoute("/finalizedSales", module: FinalizedSalesModule()),
  ];
}
