// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentStore on _PaymentStoreBase, Store {
  final _$loadingAtom = Atom(name: '_PaymentStoreBase.loading');

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

  final _$finalizedSalesAsyncAction =
      AsyncAction('_PaymentStoreBase.finalizedSales');

  @override
  Future finalizedSales(String typePayment) {
    return _$finalizedSalesAsyncAction
        .run(() => super.finalizedSales(typePayment));
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
