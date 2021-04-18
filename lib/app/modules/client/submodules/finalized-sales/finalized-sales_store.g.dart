// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finalized-sales_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FinalizedSalesStore on _FinalizedSalesStoreBase, Store {
  final _$salesCartAtom = Atom(name: '_FinalizedSalesStoreBase.salesCart');

  @override
  List<SaleModel> get salesCart {
    _$salesCartAtom.reportRead();
    return super.salesCart;
  }

  @override
  set salesCart(List<SaleModel> value) {
    _$salesCartAtom.reportWrite(value, super.salesCart, () {
      super.salesCart = value;
    });
  }

  final _$loadingAtom = Atom(name: '_FinalizedSalesStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_FinalizedSalesStoreBase.getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
salesCart: ${salesCart},
loading: ${loading}
    ''';
  }
}
