import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';

class ProductRepository implements IProductRepository {
  final FirebaseFirestore firestore;

  ProductRepository(this.firestore);

  @override
  Stream<List<ProductModel>> getAll() async* {
    var productsStream =
        firestore.collection("product").orderBy("name").snapshots();
    var products = List<ProductModel>();
    await for (var productSnapshot in productsStream) {
      for (var productDoc in productSnapshot.docs) {
        ProductModel product;
        DocumentReference categoryReference = productDoc['categoryReference'];
        DocumentSnapshot categorySnapshot = await firestore
            .collection("category")
            .doc(categoryReference.id)
            .get();
        product = ProductModel.fromDocument(
            productDoc, CategoryModel.fromDocument(categorySnapshot));
        products.add(product);
      }
      yield products;
    }
  }

  @override
  Future save(ProductModel productModel) async {
    productModel.reference = await firestore.collection('product').add({
      'name': productModel.name,
      'description': productModel.description,
      'photo': productModel.photo,
      'price': productModel.price,
      'categoryReference': productModel.categoryModel.reference
    });
  }

  @override
  Future update(ProductModel categoryModel) {
    // categoryModel.reference.update({'description': categoryModel.description});
  }

  @override
  Future delete(ProductModel categoryModel) {
    // return categoryModel.reference.delete();
  }
}
