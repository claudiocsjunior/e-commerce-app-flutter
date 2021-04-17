import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;
abstract class _ClientStoreBase with Store {

  AuthStore authStore = Modular.get();

  final ICategoryRepository categoryRepository;
  final IProductRepository productRepository;

  _ClientStoreBase(this.categoryRepository, this.productRepository){
    getDados();
  }

  @observable
  bool loading = true;

  @observable
  List<ProductModel> products = List.generate(0, (index) => ProductModel());

  @observable
  ProductModel lastProduct = ProductModel();

  @observable
  String? search;

  @observable
  String name = '';

  @observable
  String email = '';

  @action
  setSearch(value){
    search = value;
  }

  @computed
  List<ProductModel?> get computedProducts{
    if(search == null || search == ''){
      return products;
    }else{
      return products.where((element) => element.name!.contains(search!)).toList();
    }
  }

  @action
  getListProdcut() async{
    if(products == null){
      loading = true;
      //products = List<ProductModel>();
    }

    List<ProductModel> productsList = List.generate(0, (index) => ProductModel());

    QuerySnapshot querySnapshot = await productRepository.getAllPaginate(lastProduct.reference == null ? null : lastProduct);
    for (var productDoc in querySnapshot.docs) {
      DocumentReference categoryReference = productDoc['categoryReference'];
      DocumentSnapshot categorySnapshot = await categoryRepository.getByReference(categoryReference);
      ProductModel product = ProductModel.fromDocument(productDoc, CategoryModel.fromDocument(categorySnapshot));
      productsList.add(product);

      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + '/'+ product.reference!.id;

      product.image = await File(filePath).writeAsBytes(base64Decode(product.photo!));
      //tempDir.deleteSync(recursive: true);

      lastProduct = productsList.last;
    }

    if(productsList.length > 0){
      products.addAll(productsList);
    }

    loading = false;
  }


  @action
  getDados() async{
    print(authStore.user);
    email = authStore.user!.email!;
    if(authStore.user!.displayName != null){
      name = authStore.user!.displayName!;
    }

    await getListProdcut();
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

  toCategories(){
    Modular.to.pushNamedAndRemoveUntil("/client/category", ModalRoute.withName('/client/'));
  }
}