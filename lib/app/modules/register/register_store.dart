import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;
abstract class _RegisterStoreBase with Store {

  @observable
  bool loading = false;

  @action
  Future register() async {
    // try{
    //   loading = true;
    //   await auth.loginWithGoogle();
    //   Modular.to.pushReplacementNamed("/home");
    // }catch(e){
    //   loading = false;
    // }
  }
}