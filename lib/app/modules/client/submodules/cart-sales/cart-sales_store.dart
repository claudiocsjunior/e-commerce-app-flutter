import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/shared/interfaces/product_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/sale_repository_interface.dart';
import 'package:e_commerce_app/app/shared/interfaces/seller_repository_interface.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'cart-sales_store.g.dart';

class CartSalesStore = _CartSalesStoreBase with _$CartSalesStore;
abstract class _CartSalesStoreBase with Store {

  final ISaleRepository saleRepository;

  final IProductRepository productRepository;

  _CartSalesStoreBase(this.saleRepository, this.productRepository){
    getData();
  }

  @observable
  List<SaleModel> salesCart = List.generate(0, (index) => SaleModel());

  @observable
  bool loading = false;

  @observable
  SaleModel saleCartSalected = SaleModel();

  @observable
  String error = '';

  @observable
  int saleQuantity = 0;

  @action
  setSaleCartSelected(SaleModel saleModel){
    saleCartSalected = saleModel;
  }

  @action
  setQuantitySelected(int value){
    saleQuantity = value;
  }


  @action
  setSaleQuantity(String value){
    error = "";
    if(value == '' || value == null){
      error = "campo obrigatório";
      return;
    }

    print("value" + value);
    print("productQuantity "  + saleCartSalected.productModel!.quantity.toString());

    if(int.parse(value) > saleCartSalected.productModel!.quantity){
      error = "Limite de estoque ultrapassado";
      return;
    }

    saleQuantity = int.parse(value);
  }

  @action
  getData()async {
    loading = true;
    salesCart = await saleRepository.getAllByUserNotFinalized(Modular.get<ClientStore>().userId);
    loading = false;
  }

  @action
  removeSaleCart(SaleModel saleModel) async{
    loading = true;
    await saleRepository.delete(saleModel);
    salesCart = await saleRepository.getAllByUserNotFinalized(Modular.get<ClientStore>().userId);
    await Modular.get<ClientStore>().getProductsCart();
    loading = false;
  }

  @action
  updateQuantity() async{
    if(error == ""){
      saleCartSalected.quantity = saleQuantity;
      await saleRepository.update(saleCartSalected);
    }
  }

  @action
  finalizedSales(){
    for(SaleModel saleModel in salesCart){
      saleModel.finalized = true;
      saleModel.productModel!.quantity = saleModel.productModel!.quantity - saleModel.quantity!;

      productRepository.update(saleModel.productModel!);
      saleRepository.update(saleModel);
    }
  }



}