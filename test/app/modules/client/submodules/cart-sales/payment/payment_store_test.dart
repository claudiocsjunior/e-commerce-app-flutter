import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/payment/payment_store.dart';
 
void main() {
  late PaymentStore store;

  setUpAll(() {
    store = PaymentStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}