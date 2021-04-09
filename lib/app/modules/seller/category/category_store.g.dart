// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryStore on _CategoryStoreBase, Store {
  final _$categoryListAtom = Atom(name: '_CategoryStoreBase.categoryList');

  @override
  ObservableStream<List<CategoryModel>> get categoryList {
    _$categoryListAtom.reportRead();
    return super.categoryList;
  }

  @override
  set categoryList(ObservableStream<List<CategoryModel>> value) {
    _$categoryListAtom.reportWrite(value, super.categoryList, () {
      super.categoryList = value;
    });
  }

  final _$_CategoryStoreBaseActionController =
      ActionController(name: '_CategoryStoreBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_CategoryStoreBaseActionController.startAction(
        name: '_CategoryStoreBase.getList');
    try {
      return super.getList();
    } finally {
      _$_CategoryStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categoryList: ${categoryList}
    ''';
  }
}
