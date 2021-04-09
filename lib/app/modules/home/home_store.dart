import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  AuthStore authStore = Modular.get();

  @observable
  int counter = 0;

  @observable
  bool loading;

  Future<void> increment() async {
    counter = counter + 1;
  }

  Future logOut() async{
    try{
      loading = true;
      await authStore.logOut();
      Modular.to.pushReplacementNamed("/");
    }catch(e){
      loading = false;
    }

  }
}