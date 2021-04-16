import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/stock/stock_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/category_repository.dart';
import 'package:e_commerce_app/app/shared/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'stock_page.dart';

class StockModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IProductRepository>((i) => ProductRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => StockStore(i.get<IProductRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => StockPage()),
  ];
}
