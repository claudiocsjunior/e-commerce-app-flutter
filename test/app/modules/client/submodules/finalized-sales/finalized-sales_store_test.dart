import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce_app/app/modules/client/submodules/finalized-sales/finalized-sales_store.dart';
 
void main() {
  late FinalizedSalesStore store;

  setUpAll(() {
    store = FinalizedSalesStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}