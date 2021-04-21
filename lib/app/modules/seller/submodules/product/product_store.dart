import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
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
  List<ProductModel> products = List.generate(0, (index) => ProductModel());

  @observable
  ProductModel lastProduct = ProductModel();

  @observable
  String? search;

  @computed
  List<ProductModel?> get computedProducts{
    if(search == null || search == ''){
      return products;
    }else{
      return products.where((element) => element.name!.contains(search!)).toList();
    }
  }

  @action
  setSearch(value){
    search = value;
  }

  @action
  getList() async{
    if(lastProduct.reference == null){
      loading = true;
      //products = List<ProductModel>();
    }

    List<ProductModel> productsList = List.generate(0, (index) => ProductModel());

    QuerySnapshot querySnapshot = await repository.getAllPaginate(lastProduct.reference == null ? null : lastProduct, null);
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

  Future delete(ProductModel productModel) async{
    repository.delete(productModel);
    initValues();
  }

  toCreateProduct(){
    Modular.to.pushNamed("/seller/product/create");
  }

  toEditProduct(ProductModel productModel){
    Modular.to.pushNamed("/seller/product/edit", arguments: productModel);
  }

  @action
  initValues() async {
    products = List.generate(0, (index) => ProductModel());
    lastProduct = ProductModel();
    //await Future.delayed(Duration(seconds: 1));
    await getList();
  }

}