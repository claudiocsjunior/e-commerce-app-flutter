import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'seller_store.g.dart';

class SellerStore = _SellerStoreBase with _$SellerStore;
abstract class _SellerStoreBase with Store {
  AuthStore authStore = Modular.get();
  final IProductRepository productRepository;
  final ICategoryRepository categoryRepository;
  final ISaleRepository saleRepository;

  _SellerStoreBase(this.productRepository, this.categoryRepository, this.saleRepository){
    getValues();
  }

  @observable
  int? quantityCategories;

  @observable
  int? quantityProducts;

  @observable
  int? quantityStock;

  @observable
  int? quantitySales;

  @action
  getValues() async {
    quantityStock = await productRepository.countAllStock();
    quantityProducts = await productRepository.countAll();
    quantityCategories = await categoryRepository.countAll();
    quantitySales = await saleRepository.countAllFinalized();
  }

  LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }

  toHomePage(){
    Modular.to.popUntil(ModalRoute.withName('/seller/'));
  }

  toCategoty(){
    Modular.to.pushNamedAndRemoveUntil("/seller/category", ModalRoute.withName('/seller/'));
  }

  toSellers(){
    Modular.to.pushNamedAndRemoveUntil("/seller/sellers", ModalRoute.withName('/seller/'));
  }

  toSettings(){
    Modular.to.pushNamedAndRemoveUntil("/seller/settings", ModalRoute.withName('/seller/'));
  }

  toProduct(){
    Modular.to.pushNamedAndRemoveUntil("/seller/product", ModalRoute.withName('/seller/'));
  }

  toStock(){
    Modular.to.pushNamedAndRemoveUntil("/seller/stock", ModalRoute.withName('/seller/'));
  }
}