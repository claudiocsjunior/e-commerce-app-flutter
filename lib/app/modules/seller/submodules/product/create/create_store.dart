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
import 'package:path_provider/path_provider.dart';

import '../../../seller_store.dart';

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
  File? image;

  @observable
  String? error = "";

  @observable
  bool loading = false;

  @observable
  ProductModel productModel = new ProductModel();

  @observable
  ObservableStream<List<CategoryModel>>? categoryList;

  @observable
  CategoryModel? categorySelected = null;

  @action
  getListCategory() {
    categoryList = categoryRepository.getAll().asObservable();
  }

  @action
  setProductModel(ProductModel value) {
    productModel = value;
  }

  @action
  Future getImageGalery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    image = File(pickedFile!.path);
  }

  @action
  Future getImageProductEdit(ProductModel productModel) async{
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/file_01.tmp';

    image = await File(filePath).writeAsBytes(base64Decode(productModel.photo!));
  }

  @action
  Future getImageCamera() async{
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    image = File(pickedFile!.path);
  }

  @action
  setName(value) {
    productModel.name = value;
  }

  @action
  setError(value) {
    error = value;
  }


  @action
  setDescription(value) {
    productModel.description = value;
  }

  @action
  setPrice(double value) {
    productModel.price = value;
  }

  @action
  setCategorySelected(CategoryModel value) {
    categorySelected = value;
  }

  @action
  setCategorySelectedEdit(ProductModel productModel, List<CategoryModel> categories) {
    categories.forEach((CategoryModel element) {
      if(element.reference!.id == productModel.categoryModel!.reference!.id){
        categorySelected = element;
      }
    });
  }

  @action
  Future saveProduct() async{
    try{
      loading = true;
      var bytesImage = await image!.readAsBytes();
      String base64 = base64Encode(bytesImage);
      productModel.categoryModel = categorySelected!;
      productModel.photo = base64;

      if(productModel.reference == null){
        await productRepository.save(productModel);
      }else{
        await productRepository.update(productModel);
      }

      loading = false;
      error = "";
      Modular.get<SellerStore>().toProduct();
    }catch(e){
      error = e.toString();
      loading = false;
    }

  }

}