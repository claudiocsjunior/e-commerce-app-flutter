import 'package:cloud_firestore/cloud_firestore.dart';

class SellerModel{
  String email;
  DocumentReference reference;

  SellerModel({this.email = '', this.reference});

  factory SellerModel.fromDocument(DocumentSnapshot doc){
    return SellerModel(email: doc['email'], reference: doc.reference);
  }
}