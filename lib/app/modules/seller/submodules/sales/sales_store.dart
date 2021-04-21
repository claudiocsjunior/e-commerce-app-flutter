import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:mobx/mobx.dart';

part 'sales_store.g.dart';

class SalesStore = _SalesStoreBase with _$SalesStore;
abstract class _SalesStoreBase with Store {

  final ISaleRepository saleRepository;
  _SalesStoreBase(this.saleRepository){
    getData();
  }

  @observable
  List<SaleModel> salesCart = List.generate(0, (index) => SaleModel());

  @observable
  bool loading = false;


  @action
  getData()async {
    loading = true;
    salesCart = await saleRepository.getAllFinalized();
    loading = false;
  }
}