import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  AuthStore auth = Modular.get();

  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    try{
      loading = true;
      await auth.loginWithGoogle();
      Modular.to.pushReplacementNamed("/home");
    }catch(e){
      loading = false;
    }
  }

  void toRegister(){
    Modular.to.pushReplacementNamed("/register");
  }
}