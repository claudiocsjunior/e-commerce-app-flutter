import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/modules/seller/seller_page.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/category/category_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/product/product_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/sellers/sellers_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/settings/settings_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/stock/stock_module.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/repositories/category_repository.dart';
import 'package:e_commerce_app/app/shared/repositories/product_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SellerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<ICategoryRepository>((i) => CategoryRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton<IProductRepository>((i) => ProductRepository(FirebaseFirestore.instance)),
    Bind.lazySingleton((i) => SellerStore(i.get<IProductRepository>(), i.get<ICategoryRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SellerPage()),
    ModuleRoute("/settings", module: SettingsModule()),
    ModuleRoute("/sellers", module: SellersModule()),
    ModuleRoute("/category", module: CategoryModule(), transition: TransitionType.noTransition),
    ModuleRoute("/product", module: ProductModule(), transition: TransitionType.noTransition),
    ModuleRoute("/stock", module: StockModule(), transition: TransitionType.noTransition),
  ];
}

