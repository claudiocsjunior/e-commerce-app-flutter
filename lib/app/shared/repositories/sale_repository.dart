import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';

class SaleRepository implements ISaleRepository {
  final FirebaseFirestore firestore;
  final IProductRepository productRepository;
  final ICategoryRepository categoryRepository;

  SaleRepository(this.firestore, this.productRepository, this.categoryRepository);

  @override
  Future<int> countAllByUserNotFinalized(String userId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("sale")
        .where('user_id', isEqualTo: userId)
        .where('finalized', isEqualTo: false)
        .get();
    int total = querySnapshot.docs.length;
    print("total " + querySnapshot.docs.length.toString());
    return total;
  }

  @override
  Future<int> countAllByUserFinalized(String userId) async {
    QuerySnapshot querySnapshot = await firestore
        .collection("sale")
        .where('user_id', isEqualTo: userId)
        .get();
    int total = querySnapshot.docs.length;
    return total;
  }

  @override
  Future delete(SaleModel saleModel) {
    return saleModel.reference!.delete();
  }

  @override
  Future<List<SaleModel>> getAllByUserNotFinalized(String userId) async{
    QuerySnapshot querySnapshot = await firestore
        .collection("sale")
        .where('user_id', isEqualTo: userId)
        .where('finalized', isEqualTo: false)
        .get();

    List<SaleModel> sales = List.generate(0, (index) => SaleModel());

    for(var doc in querySnapshot.docs){
      DocumentReference productReference = doc['product_reference'];
      DocumentSnapshot productSnapshot = await productRepository.getByReference(productReference);

      DocumentReference categoryReference = productSnapshot['categoryReference'];
      DocumentSnapshot categorySnapshot = await categoryRepository.getByReference(categoryReference);

      ProductModel product = ProductModel.fromDocument(productSnapshot, CategoryModel.fromDocument(categorySnapshot));

      await product.processImage();

      SaleModel sale = SaleModel.fromDocument(doc, product);

      sales.add(sale);
    }

    return sales;
  }

  @override
  Future<List<SaleModel>> getAllByUserFinalized(String userId) async{
    QuerySnapshot querySnapshot = await firestore
        .collection("sale")
        .where('user_id', isEqualTo: userId)
        .where('finalized', isEqualTo: true)
        .get();

    List<SaleModel> sales = List.generate(0, (index) => SaleModel());

    for(var doc in querySnapshot.docs){
      DocumentReference productReference = doc['product_reference'];
      DocumentSnapshot productSnapshot = await productRepository.getByReference(productReference);

      DocumentReference categoryReference = productSnapshot['categoryReference'];
      DocumentSnapshot categorySnapshot = await categoryRepository.getByReference(categoryReference);

      ProductModel product = ProductModel.fromDocument(productSnapshot, CategoryModel.fromDocument(categorySnapshot));

      await product.processImage();

      SaleModel sale = SaleModel.fromDocument(doc, product);

      sales.add(sale);
    }

    return sales;
  }

  @override
  Future getByReference(DocumentReference documentReference) {
    // TODO: implement getByReference
    throw UnimplementedError();
  }

  @override
  Future save(SaleModel saleModel) async {
    saleModel.reference = await firestore.collection('sale').add({
      'user_id': saleModel.userId,
      'finalized': saleModel.finalized,
      'product_reference': saleModel.productReference,
      'quantity': saleModel.quantity
    });
  }

  @override
  Future update(SaleModel saleModel) async{
    await saleModel.reference!.update({
      'user_id': saleModel.userId,
      'finalized': saleModel.finalized,
      'product_reference': saleModel.productReference,
      'quantity': saleModel.quantity});
  }

  @override
  Future<SaleModel> getByUserAndProductNotFinalized (String userId, ProductModel productModel) async {
      QuerySnapshot querySnapshot = await firestore
        .collection("sale")
        .where('user_id', isEqualTo: userId)
        .where('finalized', isEqualTo: false)
        .where('product_reference', isEqualTo: productModel.reference)
        .limit(1)
        .get();

      if(querySnapshot.size > 0){
        return SaleModel.fromDocument(querySnapshot.docs[0], productModel);
      }

      return SaleModel();
  }
}
