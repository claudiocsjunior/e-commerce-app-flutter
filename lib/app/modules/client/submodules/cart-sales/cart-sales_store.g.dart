// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart-sales_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartSalesStore on _CartSalesStoreBase, Store {
  final _$salesCartAtom = Atom(name: '_CartSalesStoreBase.salesCart');

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

  final _$loadingAtom = Atom(name: '_CartSalesStoreBase.loading');

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

  final _$saleCartSalectedAtom =
      Atom(name: '_CartSalesStoreBase.saleCartSalected');

  @override
  SaleModel get saleCartSalected {
    _$saleCartSalectedAtom.reportRead();
    return super.saleCartSalected;
  }

  @override
  set saleCartSalected(SaleModel value) {
    _$saleCartSalectedAtom.reportWrite(value, super.saleCartSalected, () {
      super.saleCartSalected = value;
    });
  }

  final _$errorAtom = Atom(name: '_CartSalesStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$saleQuantityAtom = Atom(name: '_CartSalesStoreBase.saleQuantity');

  @override
  int get saleQuantity {
    _$saleQuantityAtom.reportRead();
    return super.saleQuantity;
  }

  @override
  set saleQuantity(int value) {
    _$saleQuantityAtom.reportWrite(value, super.saleQuantity, () {
      super.saleQuantity = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_CartSalesStoreBase.getData');

  @override
  Future getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$removeSaleCartAsyncAction =
      AsyncAction('_CartSalesStoreBase.removeSaleCart');

  @override
  Future removeSaleCart(SaleModel saleModel) {
    return _$removeSaleCartAsyncAction
        .run(() => super.removeSaleCart(saleModel));
  }

  final _$updateQuantityAsyncAction =
      AsyncAction('_CartSalesStoreBase.updateQuantity');

  @override
  Future updateQuantity() {
    return _$updateQuantityAsyncAction.run(() => super.updateQuantity());
  }

  final _$_CartSalesStoreBaseActionController =
      ActionController(name: '_CartSalesStoreBase');

  @override
  dynamic setSaleCartSelected(SaleModel saleModel) {
    final _$actionInfo = _$_CartSalesStoreBaseActionController.startAction(
        name: '_CartSalesStoreBase.setSaleCartSelected');
    try {
      return super.setSaleCartSelected(saleModel);
    } finally {
      _$_CartSalesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantitySelected(int value) {
    final _$actionInfo = _$_CartSalesStoreBaseActionController.startAction(
        name: '_CartSalesStoreBase.setQuantitySelected');
    try {
      return super.setQuantitySelected(value);
    } finally {
      _$_CartSalesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSaleQuantity(String value) {
    final _$actionInfo = _$_CartSalesStoreBaseActionController.startAction(
        name: '_CartSalesStoreBase.setSaleQuantity');
    try {
      return super.setSaleQuantity(value);
    } finally {
      _$_CartSalesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic finalizedSales() {
    final _$actionInfo = _$_CartSalesStoreBaseActionController.startAction(
        name: '_CartSalesStoreBase.finalizedSales');
    try {
      return super.finalizedSales();
    } finally {
      _$_CartSalesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
salesCart: ${salesCart},
loading: ${loading},
saleCartSalected: ${saleCartSalected},
error: ${error},
saleQuantity: ${saleQuantity}
    ''';
  }
}
