import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'client_store.g.dart';

class ClientStore = _ClientStoreBase with _$ClientStore;
abstract class _ClientStoreBase with Store {

  AuthStore authStore = Modular.get();

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  Future LogOut(){
    authStore.logOut();
    Modular.to.pushReplacementNamed("/");
  }
}