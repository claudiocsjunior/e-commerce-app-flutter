import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:path_provider/path_provider.dart';

class ProductModel {
  DocumentReference? categoryReference;
  String? description;
  String? name;
  String? photo;
  double? price;
  DocumentReference? reference;
  CategoryModel? categoryModel;
  File? image;
  int quantity ;
  int? order;

  ProductModel(
      {this.categoryReference,
      this.description,
      this.name,
      this.photo,
      this.price,
      this.reference,
      this.categoryModel,
      this.image,
      this.quantity = 0,
      this.order
      });

  factory ProductModel.fromDocument(DocumentSnapshot doc, CategoryModel categoryModel) {
    return ProductModel(
        description: doc['description'],
        categoryReference: doc['categoryReference'],
        name: doc['name'],
        photo: doc['photo'],
        price: doc['price'],
        reference: doc.reference,
        categoryModel: categoryModel,
        image: null,
        quantity: doc['quantity'],
        order: doc['order'],);
  }

  processImage() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/'+ this.reference!.id;

    this.image = await File(filePath).writeAsBytes(base64Decode(this.photo!));

    return this;
  }

}

