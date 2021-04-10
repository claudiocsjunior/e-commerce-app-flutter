// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$loadingAtom = Atom(name: '_SettingsStoreBase.loading');

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

  final _$loadingPasswordAtom =
      Atom(name: '_SettingsStoreBase.loadingPassword');

  @override
  bool get loadingPassword {
    _$loadingPasswordAtom.reportRead();
    return super.loadingPassword;
  }

  @override
  set loadingPassword(bool value) {
    _$loadingPasswordAtom.reportWrite(value, super.loadingPassword, () {
      super.loadingPassword = value;
    });
  }

  final _$emailAtom = Atom(name: '_SettingsStoreBase.email');

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

  final _$nameAtom = Atom(name: '_SettingsStoreBase.name');

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

  final _$errorAtom = Atom(name: '_SettingsStoreBase.error');

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

  final _$errorPasswordAtom = Atom(name: '_SettingsStoreBase.errorPassword');

  @override
  String get errorPassword {
    _$errorPasswordAtom.reportRead();
    return super.errorPassword;
  }

  @override
  set errorPassword(String value) {
    _$errorPasswordAtom.reportWrite(value, super.errorPassword, () {
      super.errorPassword = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SettingsStoreBase.password');

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

  final _$confirmPasswordAtom =
      Atom(name: '_SettingsStoreBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$textConfirmAtom = Atom(name: '_SettingsStoreBase.textConfirm');

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

  final _$colorConfirmAtom = Atom(name: '_SettingsStoreBase.colorConfirm');

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

  final _$updateDadosAsyncAction =
      AsyncAction('_SettingsStoreBase.updateDados');

  @override
  Future<dynamic> updateDados() {
    return _$updateDadosAsyncAction.run(() => super.updateDados());
  }

  final _$updatePasswordAsyncAction =
      AsyncAction('_SettingsStoreBase.updatePassword');

  @override
  Future<dynamic> updatePassword() {
    return _$updatePasswordAsyncAction.run(() => super.updatePassword());
  }

  final _$_SettingsStoreBaseActionController =
      ActionController(name: '_SettingsStoreBase');

  @override
  Future<dynamic> setEmail(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setName(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setError(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setError');
    try {
      return super.setError(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setErrorPassword(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setErrorPassword');
    try {
      return super.setErrorPassword(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setPassword(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setConfirmPassword(dynamic value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> getDados() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.getDados');
    try {
      return super.getDados();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> setLoading(bool value) {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> validPassword() {
    final _$actionInfo = _$_SettingsStoreBaseActionController.startAction(
        name: '_SettingsStoreBase.validPassword');
    try {
      return super.validPassword();
    } finally {
      _$_SettingsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
loadingPassword: ${loadingPassword},
email: ${email},
name: ${name},
error: ${error},
errorPassword: ${errorPassword},
password: ${password},
confirmPassword: ${confirmPassword},
textConfirm: ${textConfirm},
colorConfirm: ${colorConfirm}
    ''';
  }
}
