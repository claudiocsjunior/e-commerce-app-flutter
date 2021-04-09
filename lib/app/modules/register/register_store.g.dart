// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterStore on _RegisterStoreBase, Store {
  final _$emailAtom = Atom(name: '_RegisterStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_RegisterStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordConfirmAtom =
      Atom(name: '_RegisterStoreBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.reportRead();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.reportWrite(value, super.passwordConfirm, () {
      super.passwordConfirm = value;
    });
  }

  final _$textConfirmAtom = Atom(name: '_RegisterStoreBase.textConfirm');

  @override
  String get textConfirm {
    _$textConfirmAtom.reportRead();
    return super.textConfirm;
  }

  @override
  set textConfirm(String value) {
    _$textConfirmAtom.reportWrite(value, super.textConfirm, () {
      super.textConfirm = value;
    });
  }

  final _$colorConfirmAtom = Atom(name: '_RegisterStoreBase.colorConfirm');

  @override
  Color get colorConfirm {
    _$colorConfirmAtom.reportRead();
    return super.colorConfirm;
  }

  @override
  set colorConfirm(Color value) {
    _$colorConfirmAtom.reportWrite(value, super.colorConfirm, () {
      super.colorConfirm = value;
    });
  }

  final _$validateFormAtom = Atom(name: '_RegisterStoreBase.validateForm');

  @override
  bool get validateForm {
    _$validateFormAtom.reportRead();
    return super.validateForm;
  }

  @override
  set validateForm(bool value) {
    _$validateFormAtom.reportWrite(value, super.validateForm, () {
      super.validateForm = value;
    });
  }

  final _$erroAtom = Atom(name: '_RegisterStoreBase.erro');

  @override
  String get erro {
    _$erroAtom.reportRead();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.reportWrite(value, super.erro, () {
      super.erro = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_RegisterStoreBase.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$_RegisterStoreBaseActionController =
      ActionController(name: '_RegisterStoreBase');

  @override
  Future<dynamic> setEmail(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setPassword(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setPasswordConfirm(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setPasswordConfirm');
    try {
      return super.setPasswordConfirm(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setValidateForm(bool value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setValidateForm');
    try {
      return super.setValidateForm(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setErro(String value) {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.setErro');
    try {
      return super.setErro(value);
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> validPassword() {
    final _$actionInfo = _$_RegisterStoreBaseActionController.startAction(
        name: '_RegisterStoreBase.validPassword');
    try {
      return super.validPassword();
    } finally {
      _$_RegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordConfirm: ${passwordConfirm},
textConfirm: ${textConfirm},
colorConfirm: ${colorConfirm},
validateForm: ${validateForm},
erro: ${erro}
    ''';
  }
}
