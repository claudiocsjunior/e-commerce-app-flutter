import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'stock_store.g.dart';

class StockStore = _StockStoreBase with _$StockStore;
abstract class _StockStoreBase with Store {
  final IProductRepository repository;

  _StockStoreBase(this.repository){

  }


  @observable
  ObservableStream<List<ProductModel?>>? productList;

  @observable
  ProductModel? productSelected;

  @action
  getList() {
    productList = repository.getAll().asObservable();
  }

  @observable
  String? search;

  @observable
  int? total;

  @observable
  int quantityDefault = 0;

  @computed
  List<ProductModel?> get computedProducts{
    List<ProductModel> products = productList!.data;

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
  setTotal(){
    List<ProductModel>? products = productList!.data;

    if(products != null){
      products.forEach((ProductModel element) {
        if(total == null){
          total = 0;
        }

        total = total! + element.quantity;
      });
    }
  }

  initValues() async {
    await Future.delayed(Duration(seconds: 1));
    await getList();
  }

  @action
  setProductQuantity(ProductModel? productModel, String? value){
    productModel!.quantity = int.tryParse(value!) ?? 0;
    print(productModel.quantity);
    productSelected = productModel;
  }

  @action
  setProduct(value){
    productSelected = value;
  }

  @action
  setQuantityDefault(value){
    quantityDefault = value;
  }


  @action
  updateQuantity(ProductModel productModel) async {
    List<ProductModel> products = productList!.data;
    total = total! - quantityDefault;
    total = total! + productModel.quantity;
    await repository.updateQuantity(productModel);
  }


}