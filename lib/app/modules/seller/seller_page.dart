import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/card/card-widget.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'enums/page-enum-bottom-nav.dart';

class SellerPage extends StatefulWidget {
  final String title;

  const SellerPage({Key? key, this.title = "SellerPage"}) : super(key: key);

  @override
  SellerPageState createState() => SellerPageState();
}

class SellerPageState extends ModularState<SellerPage, SellerStore> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getValues();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "E-Commerce",
      bottomNavigationindexSelected: PageEnumBottomNav.home.index,
      functionFloatingAction: () {},
      floatingAction: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              icon: Icons.my_library_books,
              title: "Estoque",
              color1: Colors.orangeAccent,
              color2: Colors.deepOrangeAccent,
              color3: Colors.deepOrange,
              content: Observer(builder: (_){
                if(controller.quantityStock == null ){
                  return Container(
                      width: (MediaQuery.of(context).size.width - 50) * 0.5,
                      alignment: Alignment.center,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(backgroundColor: Colors.white,),
                      )

                  );
                }

                return Container(
                    width: (MediaQuery.of(context).size.width - 50) * 0.5,
                    alignment: Alignment.center,
                    child:
                    Text(controller.quantityStock.toString() + " Unidades", style: TextStyle(fontSize: TextSize.normal, color: Colors.white),)
                );
              },),
              onPress: controller.toStock,
            ),
            CardWidget(
              icon: Icons.shopping_cart,
              title: "Produtos",
              color1: Colors.lime,
              color2: Colors.lightGreen,
              color3: Colors.green,
              content: Observer(builder: (_){
                if(controller.quantityProducts == null ){
                  return Container(
                      width: (MediaQuery.of(context).size.width - 50) * 0.5,
                      alignment: Alignment.center,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(backgroundColor: Colors.white,),
                      )

                  );
                }

                return Container(
                    width: (MediaQuery.of(context).size.width - 50) * 0.5,
                    alignment: Alignment.center,
                    child:
                    Text(controller.quantityProducts.toString() + " Produtos", style: TextStyle(fontSize: TextSize.normal, color: Colors.white),)
                );
              },),
              onPress: controller.toProduct,
            ),
            CardWidget(
              icon: Icons.category_rounded,
              title: "Categorias",
              color1: Colors.orangeAccent,
              color2: Colors.deepOrangeAccent,
              color3: Colors.deepOrange,
              content: Observer(builder: (_){
                if(controller.quantityCategories == null ){
                  return Container(
                      width: (MediaQuery.of(context).size.width - 50) * 0.5,
                      alignment: Alignment.center,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(backgroundColor: Colors.white,),
                      )

                  );
                }

                return Container(
                    width: (MediaQuery.of(context).size.width - 50) * 0.5,
                    alignment: Alignment.center,
                    child:
                    Text(controller.quantityCategories.toString() + " Categorias", style: TextStyle(fontSize: TextSize.normal, color: Colors.white),)
                );
              },),
              onPress: controller.toCategoty,
            ),
            CardWidget(
              icon: Icons.double_arrow_outlined,
              title: "Vendas",
              color1: Colors.lime,
              color2: Colors.lightGreen,
              color3: Colors.green,
              content:Observer(builder: (_){
                if(controller.quantitySales == null ){
                  return Container(
                      width: (MediaQuery.of(context).size.width - 50) * 0.5,
                      alignment: Alignment.center,
                      child: Container(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(backgroundColor: Colors.white,),
                      )

                  );
                }

                return Container(
                    width: (MediaQuery.of(context).size.width - 50) * 0.5,
                    alignment: Alignment.center,
                    child:
                    Text(controller.quantitySales.toString() + " Vendas", style: TextStyle(fontSize: TextSize.normal, color: Colors.white),)
                );
              },),
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
