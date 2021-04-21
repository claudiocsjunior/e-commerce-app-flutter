import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';

abstract class ISaleRepository{

  Future<List<SaleModel>> getAllByUserNotFinalized(String userId);
  Future save(SaleModel saleModel);
  Future update(SaleModel saleModel);
  Future delete(SaleModel saleModel);
  Future getByReference(DocumentReference documentReference);
  Future<SaleModel> getByUserAndProductNotFinalized(String userId, ProductModel productModel);
  Future<int> countAllByUserNotFinalized(String UserId);
  Future<int> countAllByUserFinalized(String UserId);
  Future<List<SaleModel>> getAllByUserFinalized(String userId);
  Future<int> countAllFinalized();
  Future<List<SaleModel>> getAllFinalized();
}