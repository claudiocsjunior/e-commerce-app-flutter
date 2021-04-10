import 'package:e_commerce_app/app/modules/sellers/product/product_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class ProductModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}
