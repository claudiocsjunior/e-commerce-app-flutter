import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/sales/sales_store.dart';
 
void main() {
  late SalesStore store;

  setUpAll(() {
    store = SalesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}