import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'seller_store.g.dart';

class SellerStore = _SellerStoreBase with _$SellerStore;
abstract class _SellerStoreBase with Store {
  AuthStore authStore = Modular.get();

  Future LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }

  Future toHomePage(){
    Modular.to.popUntil(ModalRoute.withName('/seller/'));
  }

  Future toCategoty(){
    Modular.to.pushNamedAndRemoveUntil("/seller/category", ModalRoute.withName('/seller/'));
  }

  Future toSellers(){
    Modular.to.pushNamedAndRemoveUntil("/seller/sellers", ModalRoute.withName('/seller/'));
  }

  Future toSettings(){
    Modular.to.pushNamedAndRemoveUntil("/seller/settings", ModalRoute.withName('/seller/'));
  }

  Future toProduct(){
    Modular.to.pushNamedAndRemoveUntil("/seller/product", ModalRoute.withName('/seller/'));
  }
}