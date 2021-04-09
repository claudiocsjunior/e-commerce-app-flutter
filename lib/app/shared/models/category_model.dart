import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String description;
  DocumentReference reference;

  CategoryModel({this.description = '', this.reference});

  factory CategoryModel.fromDocument(DocumentSnapshot doc){
    return CategoryModel(description: doc['description'], reference: doc.reference);
  }
}