import 'dart:convert';
import 'dart:io';

import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

import '../../seller_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreateStoreBase with _$CreateStore;
abstract class _CreateStoreBase with Store {

  final picker = ImagePicker();
  final ICategoryRepository categoryRepository;
  final IProductRepository productRepository;

  _CreateStoreBase(this.productRepository, this.categoryRepository){
    getListCategory();
  }

  @observable
  File image;

  @observable
  String error = "";

  @observable
  bool loading = false;

  @observable
  ProductModel productModel = new ProductModel();

  @observable
  ObservableStream<List<CategoryModel>> categoryList;

  @observable
  CategoryModel categorySelected = null;

  @action
  getListCategory() {
    categoryList = categoryRepository.getAll().asObservable();
  }

  @action
  Future getImageGalery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    image = File(pickedFile.path);
  }

  @action
  Future getImageCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    image = File(pickedFile.path);
  }

  @action
  Future setName(value) {
    productModel.name = value;
  }

  @action
  Future setError(value) {
    error = value;
  }


  @action
  Future setDescription(value) {
    productModel.description = value;
  }

  @action
  Future setPrice(double value) {
    productModel.price = value;
  }

  @action
  Future setCategorySelected(CategoryModel value) {
    categorySelected = value;
  }

  @action
  Future saveProduct() async{
    try{
      loading = true;
      var bytesImage = await image.readAsBytes();
      String base64 = base64Encode(bytesImage);
      productModel.categoryModel = categorySelected;
      productModel.photo = base64;
      await productRepository.save(productModel);
      loading = false;
      error = "";
      Modular.get<SellerStore>().toProduct();
    }catch(e){
      error = e.toString();
      loading = false;
    }

  }

}