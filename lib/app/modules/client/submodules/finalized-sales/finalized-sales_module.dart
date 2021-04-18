import 'package:e_commerce_app/app/modules/client/submodules/finalized-sales/finalized-sales_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'finalized-sales_page.dart';

class FinalizedSalesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => FinalizedSalesStore(i.get<ISaleRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => FinalizedSalesPage()),
  ];
}
