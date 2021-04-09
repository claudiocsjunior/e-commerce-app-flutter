import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: BackgroundColor.colorPrimary),
    ).modular();
  }
}