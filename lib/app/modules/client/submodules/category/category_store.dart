import 'package:e_commerce_app/app/shared/interfaces/category_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:mobx/mobx.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStoreBase with _$CategoryStore;
abstract class _CategoryStoreBase with Store {
  final ICategoryRepository repository;

  _CategoryStoreBase(this.repository);


  @observable
  ObservableStream<List<CategoryModel>>? categoryList;

  @action
  getList() {
    categoryList = repository.getAll().asObservable();
  }

  initValues() async {
    await Future.delayed(Duration(seconds: 1));
    await getList();
  }

}