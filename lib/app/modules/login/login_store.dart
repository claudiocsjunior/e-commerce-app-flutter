import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  AuthStore auth = Modular.get();

  @observable
  bool loading = false;

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String erro = "";

  @action
  setEmail(String value){
    email = value;
  }

  @action
  setPassword(String value){
    password = value;
  }

  @action
  setErro(String value){
    erro = value;
  }

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
    Modular.to.pushNamed("/register");
  }

  @action
  Future loginEmailAndPassword() async {
    try{
      loading = true;
      await auth.LoginEmailAndPassword(email.trim(), password.trim());
      if(auth.user == null){
        setErro("Ocorreu um erro, tente novamente.");
      }else{
        Modular.to.pushReplacementNamed("/home");
      }
    }catch(e){
      loading = false;
      setErro(e.toString());
    }

  }
}