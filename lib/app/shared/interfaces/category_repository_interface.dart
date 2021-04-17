
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';

abstract class ICategoryRepository{

  Stream<List<CategoryModel>> getAll();
  Future save(CategoryModel categoryModel);
  Future update(CategoryModel categoryModel);
  Future delete(CategoryModel categoryModel);
  Future getByReference(DocumentReference documentReference);
  Future<int> countAll();
}