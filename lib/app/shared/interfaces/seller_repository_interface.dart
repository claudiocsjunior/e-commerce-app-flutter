import 'package:e_commerce_app/app/shared/models/seller_model.dart';

abstract class ISellerRepository{

  Stream<List<SellerModel>> getAll();
  Future save(SellerModel sellerModel);
  Future update(SellerModel sellerModel);
  Future delete(SellerModel sellerModel);
  Future<List<SellerModel>> getByEmail(String email);
}