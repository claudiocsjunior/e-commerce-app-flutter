import 'package:e_commerce_app/app/modules/seller/submodules/sellers/sellers_page.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/sellers/sellers_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class SellersModule extends Module {
  @override
  final List<Bind> binds = [
    //ISellerRepository adicionado no modulo principal
    Bind.lazySingleton((i) => SellersStore(i.get<ISellerRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SellersPage()),
  ];

}