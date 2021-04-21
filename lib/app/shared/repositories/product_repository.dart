import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';

class ProductRepository implements IProductRepository {
  final FirebaseFirestore firestore;

  ProductRepository(this.firestore);

  @override
  Stream<List<ProductModel?>> getAll() {
    return firestore.collection('product').orderBy('name').snapshots().map((query) {
      return query.docs.map((doc) {
        ProductModel productModel = ProductModel.fromDocument(doc, CategoryModel());
        // productModel.processImage().then(
        //     (value){
        //       return value;
        //     }
        // );
        return productModel;
      }).toList();
    });
  }

  @override
  Future save(ProductModel productModel) async {
    int total = await countAll();
    total = total + 1;

    productModel.reference = await firestore.collection('product').add({
      'name': productModel.name,
      'description': productModel.description,
      'photo': productModel.photo,
      'price': productModel.price,
      'categoryReference': productModel.categoryModel!.reference,
      'quantity': productModel.quantity,
      'order': total,
    });
  }

  @override
  Future update(ProductModel productModel) async {
    await productModel.reference!.update({
    'name': productModel.name,
    'description': productModel.description,
    'photo': productModel.photo,
    'price': productModel.price,
    'categoryReference': productModel.categoryModel!.reference,
    'quantity': productModel.quantity,
    'order': productModel.order,
    });
  }



  @override
  Future delete(ProductModel productModel) {
    return productModel.reference!.delete();
  }

  @override
  Future<QuerySnapshot> getAllPaginate(ProductModel? productModel, CategoryModel? categoryModel) async {
    var productsStream;
    if(productModel == null){
      if(categoryModel == null){
        productsStream = await firestore.collection("product").orderBy("order", descending: true).limit(10).get();
      }else{
        productsStream = await firestore.collection("product").where('categoryReference', isEqualTo: categoryModel.reference).orderBy("order", descending: true).limit(10).get();
      }

    }else{
      DocumentSnapshot lastProductSnapshot = await firestore.collection("product").doc(productModel.reference!.id).get();
      if(categoryModel == null){
        productsStream = await firestore.collection("product").orderBy("order", descending: true).startAfterDocument(lastProductSnapshot).limit(10).get();
      }else{
        productsStream = await firestore.collection("product").where('categoryReference', isEqualTo: categoryModel.reference).orderBy("order", descending: true).startAfterDocument(lastProductSnapshot).limit(10).get();
      }
    }

    return productsStream;
  }

  @override
  Future updateQuantity(ProductModel productModel) async{
    await productModel.reference!.update({
      'quantity': productModel.quantity
    });
  }

  @override
  Future<int> countAll() async{
    QuerySnapshot querySnapshot = await firestore.collection("product").get();
    int total = querySnapshot.docs.length;
    return total;
  }

  @override
  Future<int> countAllStock() async{
    QuerySnapshot querySnapshot = await firestore.collection("product").get();
    int total = 0;

    for(var doc in querySnapshot.docs){
      ProductModel productModel = ProductModel.fromDocument(doc, CategoryModel());
      total = total + productModel.quantity;
    }

    return total;
  }

  @override
  Future getByReference(DocumentReference documentReference) async{
    return firestore.collection("product").doc(documentReference.id).get();
  }

}
