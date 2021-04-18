import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;
abstract class _PaymentStoreBase with Store {

  @action
  finalizedSales() async {
    await Modular.get<CartSalesStore>().finalizedSales();
    Modular.get<ClientStore>().getProductsCart();
    Modular.get<ClientStore>().toFinalizedSales();
  }
}