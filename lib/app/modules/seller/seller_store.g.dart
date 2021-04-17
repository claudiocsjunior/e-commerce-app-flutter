// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SellerStore on _SellerStoreBase, Store {
  final _$quantityCategoriesAtom =
      Atom(name: '_SellerStoreBase.quantityCategories');

  @override
  int? get quantityCategories {
    _$quantityCategoriesAtom.reportRead();
    return super.quantityCategories;
  }

  @override
  set quantityCategories(int? value) {
    _$quantityCategoriesAtom.reportWrite(value, super.quantityCategories, () {
      super.quantityCategories = value;
    });
  }

  final _$quantityProductsAtom =
      Atom(name: '_SellerStoreBase.quantityProducts');

  @override
  int? get quantityProducts {
    _$quantityProductsAtom.reportRead();
    return super.quantityProducts;
  }

  @override
  set quantityProducts(int? value) {
    _$quantityProductsAtom.reportWrite(value, super.quantityProducts, () {
      super.quantityProducts = value;
    });
  }

  final _$quantityStockAtom = Atom(name: '_SellerStoreBase.quantityStock');

  @override
  int? get quantityStock {
    _$quantityStockAtom.reportRead();
    return super.quantityStock;
  }

  @override
  set quantityStock(int? value) {
    _$quantityStockAtom.reportWrite(value, super.quantityStock, () {
      super.quantityStock = value;
    });
  }

  final _$getValuesAsyncAction = AsyncAction('_SellerStoreBase.getValues');

  @override
  Future getValues() {
    return _$getValuesAsyncAction.run(() => super.getValues());
  }

  @override
  String toString() {
    return '''
quantityCategories: ${quantityCategories},
quantityProducts: ${quantityProducts},
quantityStock: ${quantityStock}
    ''';
  }
}
