// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$typeUserAtom = Atom(name: '_HomeStoreBase.typeUser');

  @override
  TypeUser get typeUser {
    _$typeUserAtom.reportRead();
    return super.typeUser;
  }

  @override
  set typeUser(TypeUser value) {
    _$typeUserAtom.reportWrite(value, super.typeUser, () {
      super.typeUser = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  dynamic setTypeUser(dynamic value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setTypeUser');
    try {
      return super.setTypeUser(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
typeUser: ${typeUser}
    ''';
  }
}
