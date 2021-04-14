import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;
abstract class _ProductStoreBase with Store {
  final IProductRepository repository;

  _ProductStoreBase(this.repository){

  }

  @observable
  ObservableStream<List<ProductModel>> productList;

  @action
  getList() {
    productList = repository.getAll().asObservable();
  }

  Future save(ProductModel productModel) async{
    if(productModel.reference != null){
      await repository.update(productModel);
    }else{
      await repository.save(productModel);
    }
  }

  Future delete(ProductModel productModel) async{
    return repository.delete(productModel);
  }

  Future toCreateProduct(){
    Modular.to.pushNamed("/seller/product/create");
  }


  Future<bool> initValues() async {
    await Future.delayed(Duration(seconds: 1));
    await getList();
  }

}