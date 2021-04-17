import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';

abstract class ISaleRepository{

  Stream<List<SaleModel>> getAllByUser(String userId);
  Future save(SaleModel saleModel);
  Future update(SaleModel saleModel);
  Future delete(SaleModel saleModel);
  Future getByReference(DocumentReference documentReference);
  Future<int> countAllByUser();
}