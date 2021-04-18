import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../client_store.dart';

part 'finalized-sales_store.g.dart';

class FinalizedSalesStore = _FinalizedSalesStoreBase with _$FinalizedSalesStore;
abstract class _FinalizedSalesStoreBase with Store {
  final ISaleRepository saleRepository;

  _FinalizedSalesStoreBase(this.saleRepository){
    getData();
  }

  @observable
  List<SaleModel> salesCart = List.generate(0, (index) => SaleModel());

  @observable
  bool loading = false;


  @action
  getData()async {
    loading = true;
    salesCart = await saleRepository.getAllByUserFinalized(Modular.get<ClientStore>().userId);
    loading = false;
  }

}