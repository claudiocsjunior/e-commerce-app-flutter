import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';

class SaleModel {
  DocumentReference? productReference;
  DocumentReference? reference;
  String? userId;
  int? quantity;
  ProductModel? productModel;
  bool? finalized;

  SaleModel(
      {this.userId,
      this.quantity,
      this.productReference,
      this.productModel,
      this.finalized,
      this.reference});

  factory SaleModel.fromDocument(
      DocumentSnapshot doc, ProductModel productModel) {
    return SaleModel(
      userId: doc['user_id'],
      quantity: doc['quantity'],
      reference: doc.reference,
      finalized: doc['finalized'],
      productReference: doc['product_reference'],
      productModel: productModel,
    );
  }
}
