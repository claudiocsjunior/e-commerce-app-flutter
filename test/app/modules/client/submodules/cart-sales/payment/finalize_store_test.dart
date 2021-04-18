import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/finalize/finalize_store.dart';
 
void main() {
  late FinalizeStore store;

  setUpAll(() {
    store = FinalizeStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}