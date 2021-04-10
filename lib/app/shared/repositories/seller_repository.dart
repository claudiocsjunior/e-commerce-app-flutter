import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/seller_model.dart';

class SellerRepository implements ISellerRepository{
  final FirebaseFirestore firestore;

  SellerRepository(this.firestore);

  @override
  Stream<List<SellerModel>> getAll() {
    return firestore.collection('seller').orderBy('email').snapshots().map((query) {
      return query.docs.map((doc) {
        return SellerModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future save(SellerModel sellerModel) async{
    sellerModel.reference = await firestore.collection('seller').add({'email': sellerModel.email});
  }

  @override
  Future update(SellerModel sellerModel) {
    sellerModel.reference.update({'email': sellerModel.email});
  }

  @override
  Future delete(SellerModel sellerModel) {
    return sellerModel.reference.delete();
  }

  @override
  Future<List<SellerModel>> getByEmail(String email) async{
    return firestore.collection('seller').where('email', isEqualTo: email.trim()).get().then((QuerySnapshot querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return SellerModel.fromDocument(doc);
      }).toList();
    });
  }
}