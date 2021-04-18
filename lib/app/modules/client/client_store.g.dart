// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientStore on _ClientStoreBase, Store {
  Computed<List<ProductModel?>>? _$computedProductsComputed;

  @override
  List<ProductModel?> get computedProducts => (_$computedProductsComputed ??=
          Computed<List<ProductModel?>>(() => super.computedProducts,
              name: '_ClientStoreBase.computedProducts'))
      .value;

  final _$loadingAtom = Atom(name: '_ClientStoreBase.loading');

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

  final _$productsAtom = Atom(name: '_ClientStoreBase.products');

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

  final _$lastProductAtom = Atom(name: '_ClientStoreBase.lastProduct');

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

  final _$searchAtom = Atom(name: '_ClientStoreBase.search');

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

  final _$nameAtom = Atom(name: '_ClientStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_ClientStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$userIdAtom = Atom(name: '_ClientStoreBase.userId');

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  final _$productsCartAtom = Atom(name: '_ClientStoreBase.productsCart');

  @override
  int? get productsCart {
    _$productsCartAtom.reportRead();
    return super.productsCart;
  }

  @override
  set productsCart(int? value) {
    _$productsCartAtom.reportWrite(value, super.productsCart, () {
      super.productsCart = value;
    });
  }

  final _$getProductsCartAsyncAction =
      AsyncAction('_ClientStoreBase.getProductsCart');

  @override
  Future getProductsCart() {
    return _$getProductsCartAsyncAction.run(() => super.getProductsCart());
  }

  final _$addProductCartAsyncAction =
      AsyncAction('_ClientStoreBase.addProductCart');

  @override
  Future addProductCart(ProductModel productModel) {
    return _$addProductCartAsyncAction
        .run(() => super.addProductCart(productModel));
  }

  final _$getListProdcutAsyncAction =
      AsyncAction('_ClientStoreBase.getListProdcut');

  @override
  Future getListProdcut() {
    return _$getListProdcutAsyncAction.run(() => super.getListProdcut());
  }

  final _$getDadosAsyncAction = AsyncAction('_ClientStoreBase.getDados');

  @override
  Future getDados() {
    return _$getDadosAsyncAction.run(() => super.getDados());
  }

  final _$_ClientStoreBaseActionController =
      ActionController(name: '_ClientStoreBase');

  @override
  dynamic setSearch(dynamic value) {
    final _$actionInfo = _$_ClientStoreBaseActionController.startAction(
        name: '_ClientStoreBase.setSearch');
    try {
      return super.setSearch(value);
    } finally {
      _$_ClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initStateProduct() {
    final _$actionInfo = _$_ClientStoreBaseActionController.startAction(
        name: '_ClientStoreBase.initStateProduct');
    try {
      return super.initStateProduct();
    } finally {
      _$_ClientStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
products: ${products},
lastProduct: ${lastProduct},
search: ${search},
name: ${name},
email: ${email},
userId: ${userId},
productsCart: ${productsCart},
computedProducts: ${computedProducts}
    ''';
  }
}
