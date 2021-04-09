import 'dart:async';

import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/enums/Auth_status.dart';
import 'package:e_commerce_app/app/shared/enums/type_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "HomePage"}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends ModularState<HomePage, HomeStore> {
  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun((_) {
      Timer(Duration(seconds: 1), () {
        //TODO Verificar o tipo do usuário
        AuthStore auth = Modular.get();
        if(auth.user.uid == 'YfZ1XG2CU9UDRqIbge2EwlaCbaC3'){
          controller.setTypeUser(TypeUser.seller);
        }else{
          controller.setTypeUser(TypeUser.client);
        }

        if(controller.typeUser == TypeUser.client){
          Modular.to.pushReplacementNamed("/client");
        }else if(controller.typeUser == TypeUser.seller){
          Modular.to.pushReplacementNamed("/seller");
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}