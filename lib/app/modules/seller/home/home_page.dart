import 'package:e_commerce_app/app/modules/seller/home/home_store.dart';
import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("E-commerce"),
        actions: [
          Settings(),
          Users(),
          Logout(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(currentIndex: 0,),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}