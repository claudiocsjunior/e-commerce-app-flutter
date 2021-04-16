import 'package:e_commerce_app/app/modules/seller/seller_page.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/category/category_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/product/product_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/sellers/sellers_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/settings/settings_module.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/stock/stock_module.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SellerModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SellerStore()),
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
