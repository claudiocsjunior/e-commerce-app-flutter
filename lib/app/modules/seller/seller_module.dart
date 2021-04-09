import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/seller/category/category_page.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/category_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'category/category_store.dart';

import 'home/home_page.dart';
import 'home/home_store.dart';

class SellerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SellerStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton<ICategoryRepository>((i) => CategoryRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => CategoryStore(i.get<ICategoryRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute("/category", child: (_, args) => CategoryPage()),
  ];
}
