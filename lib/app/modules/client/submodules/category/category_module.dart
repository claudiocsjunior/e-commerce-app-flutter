import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/client/submodules/category/category_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/category_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'category_page.dart';

class CategoryModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ICategoryRepository>((i) => CategoryRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => CategoryStore(i.get<ICategoryRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => CategoryPage()),
  ];
}
