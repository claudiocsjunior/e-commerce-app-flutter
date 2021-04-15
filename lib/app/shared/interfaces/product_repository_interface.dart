import 'package:e_commerce_app/app/shared/models/product_model.dart';

abstract class IProductRepository{

  Stream<List<ProductModel>> getAll(var productModel);
  Future save(ProductModel productModel);
  Future update(ProductModel productModel);
  Future delete(ProductModel productModel);
}