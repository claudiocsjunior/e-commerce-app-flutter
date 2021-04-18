import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_store.dart';
 
void main() {
  late CartSalesStore store;

  setUpAll(() {
    store = CartSalesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}