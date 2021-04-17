import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;
abstract class _ClientStoreBase with Store {

  AuthStore authStore = Modular.get();

  _ClientStoreBase(){
    getDados();
  }


  @observable
  String name = '';

  @observable
  String email = '';

  @action
  getDados() {
    print(authStore.user);
    email = authStore.user!.email!;
    if(authStore.user!.displayName != null){
      name = authStore.user!.displayName!;
    }
  }

  LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }

  toSettings(){
    Modular.to.pushNamedAndRemoveUntil("/client/settings", ModalRoute.withName('/client/'));
  }

  toHomePage(){
    Modular.to.popUntil(ModalRoute.withName('/client/'));
  }
}