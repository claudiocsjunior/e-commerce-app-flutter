import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/seller/product/product_page.dart';
import 'package:e_commerce_app/app/modules/seller/product/product_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IProductRepository>((i) => ProductRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => ProductStore(i.get<IProductRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => ProductPage()),
  ];

}