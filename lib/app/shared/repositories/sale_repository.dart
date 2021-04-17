import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';

class SaleRepository implements ISaleRepository{
  @override
  Future<int> countAllByUser() {
    // TODO: implement countAllByUser
    throw UnimplementedError();
  }

  @override
  Future delete(SaleModel saleModel) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Stream<List<SaleModel>> getAllByUser(String userId) {
    // TODO: implement getAllByUser
    throw UnimplementedError();
  }

  @override
  Future getByReference(DocumentReference documentReference) {
    // TODO: implement getByReference
    throw UnimplementedError();
  }

  @override
  Future save(SaleModel saleModel) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future update(SaleModel saleModel) {
    // TODO: implement update
    throw UnimplementedError();
  }

}