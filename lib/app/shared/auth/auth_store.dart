import 'package:e_commerce_app/app/shared/enums/Auth_status.dart';
import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IauthRepository _authRepository = Modular.get();

  @observable
  User user = null;

  @observable
  AuthStatus status = AuthStatus.loading;

  @action
  setUser(User value) {
    user = value;
    status =
        user == null ? status = AuthStatus.logoff : status = AuthStatus.login;
  }

  _AuthStoreBase() {
    _authRepository.getUser().then(setUser);
  }

  Future loginWithGoogle() async {
    setUser(await _authRepository.getGoogleLogin());
  }

  Future logOut() async {
    await _authRepository.logOut();
    setUser(null);
  }
}
