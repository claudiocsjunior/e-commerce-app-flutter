import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';

abstract class IProductRepository{

  Stream<List<ProductModel?>> getAll();
  Future save(ProductModel productModel);
  Future update(ProductModel productModel);
  Future updateQuantity(ProductModel productModel);
  Future delete(ProductModel productModel);
  Future<QuerySnapshot> getAllPaginate(ProductModel? productModel, CategoryModel? categoryModel);
  Future<int> countAll();
  Future<int> countAllStock();
  Future getByReference(DocumentReference documentReference);
}