import 'package:e_commerce_app/app/shared/models/product_model.dart';

abstract class IProductRepository{

  Stream<List<ProductModel>> getAll();
  Future save(ProductModel productModel);
  Future update(ProductModel productModel);
  Future delete(ProductModel productModel);
}