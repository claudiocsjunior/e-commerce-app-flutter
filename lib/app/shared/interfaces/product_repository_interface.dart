import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';

abstract class IProductRepository{

  Stream<List<ProductModel>> getAll(var productModel);
  Future save(ProductModel productModel);
  Future update(ProductModel productModel);
  Future delete(ProductModel productModel);
  Future<QuerySnapshot> getAllPaginate(ProductModel productModel);
}