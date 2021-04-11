import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/home/home_store.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/logout/logout.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/settings/setting.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "HomePage"}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}
class HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "E-Commerce",
      bottomNavigationindexSelected: PageEnumBottomNav.home.index,
      body: Container(),
    );
  }
}