import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/repositories/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard implements RouteGuard {
  @override
  Future<bool> canActivate(String url, ModularRoute route) async{
    AuthStore authStore = Modular.get();

    //Verificar tbm o tipo de usuário, cliente ou vendedor

    if (authStore.user != null){
      return true;
    } else {
      return false;
    }
  }
}