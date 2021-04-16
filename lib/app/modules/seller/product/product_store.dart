import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;
abstract class _ProductStoreBase with Store {
  final IProductRepository repository;
  final ICategoryRepository categoryRepository;

  _ProductStoreBase(this.repository, this.categoryRepository){

  }

  @observable
  bool loading = true;

  @observable
  ObservableList<ProductModel> products;

  @observable
  ProductModel lastProduct;

  @action
  getList() async{
    if(products == null){
      loading = true;
      products = ObservableList<ProductModel>();
    }

    ObservableList<ProductModel> productsList = ObservableList<ProductModel>();

    QuerySnapshot querySnapshot = await repository.getAllPaginate(lastProduct);
      for (var productDoc in querySnapshot.docs) {
        DocumentReference categoryReference = productDoc['categoryReference'];
        DocumentSnapshot categorySnapshot = await categoryRepository.getByReference(categoryReference);
        ProductModel product = ProductModel.fromDocument(productDoc, CategoryModel.fromDocument(categorySnapshot));
        productsList.add(product);

        lastProduct = productsList.last;
      }

      if(productsList.length > 0){
        products.addAll(productsList);
      }

      loading = false;
  }

  Future delete(ProductModel productModel) async{
    return repository.delete(productModel);
  }

  Future toCreateProduct(){
    Modular.to.pushNamed("/seller/product/create");
  }

  Future toEditProduct(ProductModel productModel){
    Modular.to.pushNamed("/seller/product/edit", arguments: productModel);
  }


  Future<bool> initValues() async {
    await Future.delayed(Duration(seconds: 1));
    await getList();
  }

}