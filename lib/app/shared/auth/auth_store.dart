import 'package:e_commerce_app/app/shared/enums/Auth_status.dart';
import 'package:e_commerce_app/app/shared/interfaces/auth_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/seller_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future register(email, password) async {
    try{
      User user = await _authRepository.register(email:email, password: password);
      setUser(user);
      return user;
    }catch(e){
      throw e;
    }
  }

  Future LoginEmailAndPassword(email, password) async {
    try{
      User user = await _authRepository.getEmailLogin(email:email, password: password);
      setUser(user);
      return user;
    }catch(e){
      throw e;
    }
  }

  Future setName(String name) async {
    try{
      User user = await _authRepository.setName(name);
      setUser(user);
    }catch(e){
      throw e;
    }
  }

  Future setEmail(String email) async {
    try{
      User user = await _authRepository.setEmail(email);
      setUser(user);
    }catch(e){
      throw e;
    }
  }

  Future setPassword(String password) async {
    try{
      User user = await _authRepository.setPassword(password);
      setUser(user);
    }catch(e){
      throw e;
    }
  }


}
