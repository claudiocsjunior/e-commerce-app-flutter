import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'seller_store.g.dart';

class SellerStore = _SellerStoreBase with _$SellerStore;
abstract class _SellerStoreBase with Store {
  AuthStore authStore = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  Future LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }

  Future toHomePage(){
    Modular.to.pushReplacementNamed("/seller");
  }

  Future toCategoty(){
    Modular.to.pushReplacementNamed("/seller/category");
  }

  Future toSellers(){
    Modular.to.pushReplacementNamed("/seller/sellers");
  }
}