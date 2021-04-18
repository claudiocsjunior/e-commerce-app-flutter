import 'package:mobx/mobx.dart';

part 'cart-sales_store.g.dart';

class CartSalesStore = _CartSalesStoreBase with _$CartSalesStore;
abstract class _CartSalesStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}