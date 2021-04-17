import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';

class CategoryRepository implements ICategoryRepository{

  final FirebaseFirestore firestore;

  CategoryRepository(this.firestore);

  @override
  Stream<List<CategoryModel>> getAll() {
    return firestore.collection('category').orderBy('description').snapshots().map((query) {
      return query.docs.map((doc) {
        return CategoryModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future save(CategoryModel categoryModel) async{
    categoryModel.reference = await firestore.collection('category').add({'description': categoryModel.description});
  }

  @override
  Future update(CategoryModel categoryModel) async{
      await categoryModel.reference!.update({'description': categoryModel.description});
  }

  @override
  Future delete(CategoryModel categoryModel) {
    return categoryModel.reference!.delete();
  }

  @override
  Future getByReference(DocumentReference documentReference){
    return firestore.collection("category").doc(documentReference.id).get();
  }

  @override
  Future<int> countAll() async {
    QuerySnapshot querySnapshot = await firestore.collection("category").get();
    int total = querySnapshot.docs.length;
    return total;
  }





}