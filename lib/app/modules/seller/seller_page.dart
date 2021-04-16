import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:flutter/material.dart';

import 'enums/page-enum-bottom-nav.dart';

class SellerPage extends StatefulWidget {
  final String title;
  const SellerPage({Key? key, this.title = "SellerPage"}) : super(key: key);
  @override
  SellerPageState createState() => SellerPageState();
}
class SellerPageState extends State<SellerPage> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "E-Commerce",
      bottomNavigationindexSelected: PageEnumBottomNav.home.index,
      functionFloatingAction: (){},
      body: Container(),
    );
  }
}