
import 'package:e_commerce_app/app/shared/models/category_model.dart';

abstract class ICategoryRepository{

  Stream<List<CategoryModel>> getAll();
  Future save(CategoryModel categoryModel);
  Future update(CategoryModel categoryModel);
  Future delete(CategoryModel categoryModel);
}