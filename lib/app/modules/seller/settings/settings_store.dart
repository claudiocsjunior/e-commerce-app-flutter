import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;
abstract class _SettingsStoreBase with Store {
  AuthStore authStore = Modular.get();

  _SettingsStoreBase(){
    getDados();
  }

  @observable
  bool loading = false;

  @observable
  bool loadingPassword = false;

  @observable
  String email = "";

  @observable
  String name = "";

  @observable
  String error = "";

  @observable
  String errorPassword = "";

  @observable
  String password = "";

  @observable
  String confirmPassword = "";

  @observable
  String textConfirm = '';

  @observable
  Color colorConfirm = TextColor.colorSuccess;

  @action
  Future setEmail(value) {
    email = value;
  }

  @action
  Future setName(value) {
    name = value;
  }

  @action
  Future setError(value) {
    error = value;
  }

  @action
  Future setErrorPassword(value) {
    errorPassword = value;
  }

  @action
  Future setPassword(value) {
    password = value;
    validPassword();
  }

  @action
  Future setConfirmPassword(value) {
    confirmPassword = value;
    validPassword();
  }

  @action
  Future getDados() {
    email = authStore.user.email;
    name = authStore.user.displayName;
  }

  @action
  Future setLoading(bool value) {
    loading = value;
  }

  @action
  Future updateDados() async{
    try{
      loading = true;
      await authStore.setName(name);
      await authStore.setEmail(email);
      await getDados();
      loading = false;
      error = "";
    }catch(e){
      error = e.toString();
      loading = false;
    }

  }

  @action
  Future validPassword() {
    if(confirmPassword == ""){
      textConfirm = "";
      colorConfirm = TextColor.colorSuccess;
    }else{
      if(password == confirmPassword){
        textConfirm = "Senhas conferem";
        colorConfirm = TextColor.colorSuccess;
      }else{
        textConfirm = "Senhas não conferem";
        colorConfirm = TextColor.colorDanger;
      }
    }
  }

  @action
  Future updatePassword() async{
    try{
      loadingPassword = true;
      await authStore.setPassword(password);
      await getDados();
      loadingPassword = false;
      errorPassword = "";
    }catch(e){
      errorPassword = e.toString();
      loadingPassword = false;
    }

  }

}