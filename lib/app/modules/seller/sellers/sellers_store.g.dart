// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sellers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SellersStore on _SellersStoreBase, Store {
  final _$sellerListAtom = Atom(name: '_SellersStoreBase.sellerList');

  @override
  ObservableStream<List<SellerModel>>? get sellerList {
    _$sellerListAtom.reportRead();
    return super.sellerList;
  }

  @override
  set sellerList(ObservableStream<List<SellerModel>>? value) {
    _$sellerListAtom.reportWrite(value, super.sellerList, () {
      super.sellerList = value;
    });
  }

  final _$_SellersStoreBaseActionController =
      ActionController(name: '_SellersStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_SellersStoreBaseActionController.startAction(
        name: '_SellersStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$_SellersStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sellerList: ${sellerList}
    ''';
  }
}
