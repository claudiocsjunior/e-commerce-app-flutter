import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';

part 'product_store.g.dart';

class ProductStore = _ProductStoreBase with _$ProductStore;
abstract class _ProductStoreBase with Store {
  final IProductRepository repository;

  _ProductStoreBase(this.repository){

  }

  @observable
  ObservableStream<List<ProductModel>> productList;

  @action
  getList() {
    productList = repository.getAll().asObservable();
  }

  Future save(ProductModel productModel) async{
    if(productModel.reference != null){
      await repository.update(productModel);
    }else{
      await repository.save(productModel);
    }
  }

  Future delete(ProductModel productModel) async{
    return repository.delete(productModel);
  }

}