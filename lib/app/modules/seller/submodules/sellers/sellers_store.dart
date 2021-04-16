import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/seller_model.dart';
import 'package:mobx/mobx.dart';

part 'sellers_store.g.dart';

class SellersStore = _SellersStoreBase with _$SellersStore;
abstract class _SellersStoreBase with Store {
  final ISellerRepository repository;

  _SellersStoreBase(this.repository){
    getList();
  }

  @observable
  ObservableStream<List<SellerModel>>? sellerList;

  @action
  getList(){
    sellerList = repository.getAll().asObservable();
  }

  Future save(SellerModel sellerModel) async{
    if(sellerModel.reference != null){
      await repository.update(sellerModel);
    }else{
      await repository.save(sellerModel);
    }
  }

  Future delete(SellerModel sellerModel) async{
    return repository.delete(sellerModel);
  }
}