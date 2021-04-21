import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
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
  final ISaleRepository saleRepository;

  _ClientStoreBase(this.categoryRepository, this.productRepository, this.saleRepository){
    getProductsCart();
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

  @observable
  String userId = '';

  @observable
  int? productsCart;

  @observable
  bool refresh = false;


  @action
  getProductsCart() async{
    productsCart = await saleRepository.countAllByUserNotFinalized(userId);
  }

  @action
  setSearch(value){
    search = value;
  }

  @action
  setRefresh(value){
    refresh = value;
  }

  @action
  refreshList(CategoryModel? categoryModel){
    refresh = false;
    initStateProduct();
    getDados(categoryModel);
  }


  @action
  addProductCart(ProductModel productModel) async{
    SaleModel saleModel = await saleRepository.getByUserAndProductNotFinalized(userId, productModel);

    if(saleModel.reference == null){
      saleModel = SaleModel(userId: userId, quantity: 1, finalized: false, productReference: productModel.reference);
      await saleRepository.save(saleModel);
    }else{
      saleModel.quantity = saleModel.quantity! + 1;
      await saleRepository.update(saleModel);
    }

    productsCart = null;
    getProductsCart();
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
  getListProdcut(CategoryModel? categoryModel) async{
    if(lastProduct.reference == null){
      loading = true;
      //products = List<ProductModel>();
    }

    List<ProductModel> productsList = List.generate(0, (index) => ProductModel());

    QuerySnapshot querySnapshot = await productRepository.getAllPaginate(lastProduct.reference == null ? null : lastProduct, categoryModel);
    for (var productDoc in querySnapshot.docs) {
      DocumentReference categoryReference = productDoc['categoryReference'];
      DocumentSnapshot categorySnapshot = await categoryRepository.getByReference(categoryReference);
      ProductModel product = ProductModel.fromDocument(productDoc, CategoryModel.fromDocument(categorySnapshot));

      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      var filePath = tempPath + '/'+ product.reference!.id;

      product.image = await File(filePath).writeAsBytes(base64Decode(product.photo!));
      productsList.add(product);
      //tempDir.deleteSync(recursive: true);
    }

    lastProduct = productsList.last;

    if(productsList.length > 0){
      products.addAll(productsList);
    }

    loading = false;
  }

  @action
  initStateProduct(){
    lastProduct = ProductModel();
    products = List.generate(0, (index) => ProductModel());
  }

  @action
  getDados(CategoryModel? categoryModel) async{
    userId = authStore.user!.uid;
    email = authStore.user!.email!;
    if(authStore.user!.displayName != null){
      name = authStore.user!.displayName!;
    }

    await getListProdcut(categoryModel);
  }

  LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }

  toSettings(){
    Modular.to.pushNamedAndRemoveUntil("/client/settings", ModalRoute.withName('/client/'));
  }

  toHomePage(){
    refreshList(null);
    Modular.to.popUntil(ModalRoute.withName('/client/'));
  }

  toCategories(){
    Modular.to.pushNamedAndRemoveUntil("/client/category", ModalRoute.withName('/client/'));
  }

  toCartSales(){
    Modular.to.pushNamedAndRemoveUntil("/client/cartSales", ModalRoute.withName('/client/'));
  }

  toFinalizedSales(){
    Modular.to.pushNamedAndRemoveUntil("/client/finalizedSales", ModalRoute.withName('/client/'));
  }

  toPayment(){
    Modular.to.pushNamed("/client/cartSales/payment");
  }

  toHomeByCategory(CategoryModel categoryModel){
    initStateProduct();
    Modular.to.pushNamed("/client/productsByCategory", arguments: categoryModel);
  }

}