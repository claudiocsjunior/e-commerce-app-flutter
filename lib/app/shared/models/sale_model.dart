import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';

class SaleModel {
  DocumentReference? productReference;
  String? userId;
  int? quantity;
  ProductModel? productModel;
  bool? finalized;

  SaleModel(
      {this.userId,
      this.quantity,
      this.productReference,
      this.productModel,
      this.finalized});

  factory SaleModel.fromDocument(
      DocumentSnapshot doc, ProductModel productModel) {
    return SaleModel(
      userId: doc['user_id'],
      quantity: doc['quantity'],
      productReference: doc['product_reference'],
      productModel: productModel,
    );
  }
}
