import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;
abstract class _RegisterStoreBase with Store {

  AuthStore auth = Modular.get<AuthStore>();

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String passwordConfirm = '';

  @observable
  String textConfirm = '';

  @observable
  Color colorConfirm = TextColor.colorSuccess;

  @observable
  bool validateForm = false;

  @observable
  String erro = "";

  @action
  Future setEmail(String value) {
    email = value;
  }

  @action
  Future setPassword(String value) {
    password = value;
    validPassword();
  }

  @action
  Future setPasswordConfirm(String value) {
    passwordConfirm = value;
    validPassword();
  }

  @action
  Future setValidateForm(bool value) {
    validateForm = value;
  }

  @action
  Future setErro(String value) {
    erro = value;
  }


  @action
  Future validPassword() {
    if(passwordConfirm == ""){
      textConfirm = "";
      colorConfirm = TextColor.colorSuccess;
    }else{
      if(password == passwordConfirm){
        textConfirm = "Senhas conferem";
        colorConfirm = TextColor.colorSuccess;
      }else{
        textConfirm = "Senhas não conferem";
        colorConfirm = TextColor.colorDanger;
      }
    }
  }

  @action
  Future register() async {
    try{
      await auth.register(email.trim(), password.trim());
      if(auth.user == null){
        setErro("Ocorreu um erro, tente novamente.");
        setValidateForm(false);
      }else{
        Modular.to.pushReplacementNamed("/home");
      }
    }catch(e){
      setErro(e.toString());
    }

  }
}