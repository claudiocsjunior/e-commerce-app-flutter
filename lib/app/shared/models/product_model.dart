import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';

class ProductModel {
  DocumentReference categoryReference;
  String description;
  String name;
  String photo;
  var price;
  String size;
  DocumentReference reference;
  CategoryModel categoryModel;

  ProductModel(
      {this.categoryReference,
      this.description,
      this.name,
      this.size,
      this.photo,
      this.price,
      this.reference,
      this.categoryModel
      });

  factory ProductModel.fromDocument(DocumentSnapshot doc, CategoryModel categoryModel) {
    return ProductModel(
        description: doc['description'],
        categoryReference: doc['categoryReference'],
        name: doc['name'],
        size: doc['size'],
        photo: doc['photo'],
        price: doc['price'],
        reference: doc.reference,
        categoryModel: categoryModel);
  }
}

