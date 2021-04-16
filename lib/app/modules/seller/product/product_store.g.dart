// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductStore on _ProductStoreBase, Store {
  final _$loadingAtom = Atom(name: '_ProductStoreBase.loading');

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

  final _$productsAtom = Atom(name: '_ProductStoreBase.products');

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$lastProductAtom = Atom(name: '_ProductStoreBase.lastProduct');

  @override
  ProductModel get lastProduct {
    _$lastProductAtom.reportRead();
    return super.lastProduct;
  }

  @override
  set lastProduct(ProductModel value) {
    _$lastProductAtom.reportWrite(value, super.lastProduct, () {
      super.lastProduct = value;
    });
  }

  final _$getListAsyncAction = AsyncAction('_ProductStoreBase.getList');

  @override
  Future getList() {
    return _$getListAsyncAction.run(() => super.getList());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
products: ${products},
lastProduct: ${lastProduct}
    ''';
  }
}
