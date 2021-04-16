// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StockStore on _StockStoreBase, Store {
  Computed<List<ProductModel?>>? _$computedProductsComputed;

  @override
  List<ProductModel?> get computedProducts => (_$computedProductsComputed ??=
          Computed<List<ProductModel?>>(() => super.computedProducts,
              name: '_StockStoreBase.computedProducts'))
      .value;

  final _$productListAtom = Atom(name: '_StockStoreBase.productList');

  @override
  ObservableStream<List<ProductModel?>>? get productList {
    _$productListAtom.reportRead();
    return super.productList;
  }

  @override
  set productList(ObservableStream<List<ProductModel?>>? value) {
    _$productListAtom.reportWrite(value, super.productList, () {
      super.productList = value;
    });
  }

  final _$productSelectedAtom = Atom(name: '_StockStoreBase.productSelected');

  @override
  ProductModel? get productSelected {
    _$productSelectedAtom.reportRead();
    return super.productSelected;
  }

  @override
  set productSelected(ProductModel? value) {
    _$productSelectedAtom.reportWrite(value, super.productSelected, () {
      super.productSelected = value;
    });
  }

  final _$searchAtom = Atom(name: '_StockStoreBase.search');

  @override
  String? get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String? value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$updateQuantityAsyncAction =
      AsyncAction('_StockStoreBase.updateQuantity');

  @override
  Future updateQuantity(ProductModel productModel) {
    return _$updateQuantityAsyncAction
        .run(() => super.updateQuantity(productModel));
  }

  final _$_StockStoreBaseActionController =
      ActionController(name: '_StockStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_StockStoreBaseActionController.startAction(
        name: '_StockStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$_StockStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSearch(dynamic value) {
    final _$actionInfo = _$_StockStoreBaseActionController.startAction(
        name: '_StockStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_StockStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductQuantity(ProductModel? productModel, String? value) {
    final _$actionInfo = _$_StockStoreBaseActionController.startAction(
        name: '_StockStoreBase.setProductQuantity');
    try {
      return super.setProductQuantity(productModel, value);
    } finally {
      _$_StockStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProduct(dynamic value) {
    final _$actionInfo = _$_StockStoreBaseActionController.startAction(
        name: '_StockStoreBase.setProduct');
    try {
      return super.setProduct(value);
    } finally {
      _$_StockStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productList: ${productList},
productSelected: ${productSelected},
search: ${search},
computedProducts: ${computedProducts}
    ''';
  }
}
