import 'dart:async';

import 'package:e_commerce_app/app/shared/auth/auth_store.dart';
import 'package:e_commerce_app/app/shared/enums/Auth_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({Key key, this.title = "SplashPage"}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();

    disposer = autorun((_) {
      final auth = Modular.get<AuthStore>();
      Timer(Duration(seconds: 1), () {
        if(auth.status == AuthStatus.login){
          Modular.to.pushReplacementNamed("/home");
        }else if(auth.status == AuthStatus.logoff){
          Modular.to.pushReplacementNamed("/login");
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
