import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/card-product/card-product.dart';
import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-options/drawer-options.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-widget/drawer-widget.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClientPage extends StatefulWidget {
  final String title;

  const ClientPage({Key? key, this.title = "ClientPage"}) : super(key: key);

  @override
  ClientPageState createState() => ClientPageState();
}

class ClientPageState extends ModularState<ClientPage, ClientStore> {
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  final snackBarLoading = SnackBar(
      backgroundColor: BackgroundColor.colorWhite,
      duration: Duration(seconds: 1),
      content: Container(
          alignment: Alignment.center,
          height: 50,
          width: 20,
          child: RefreshProgressIndicator()));

  @override
  void initState() {
    super.initState();
    controller.getDados();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {

        controller.initStateProduct();
        controller.getListProdcut();
      }

      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ScaffoldMessenger.of(context).showSnackBar(snackBarLoading);
        controller.getListProdcut();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
        titulo: "E-commerce",
        body: Column(
          children: [
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Observer(builder: (_) {
                return Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    initialValue: controller.search,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      icon: Icon(Icons.filter_alt),
                      hintText: "Filtrar por...",
                    ),
                    onChanged: (value) => controller.setSearch(value),
                  ),
                );
              }),
            ),
           Expanded(child:  Observer(builder: (_) {
             if (controller.loading) {
               return Center(
                 child: CircularProgressIndicator(),
               );
             }

             if (controller.computedProducts.length == 0) {
               return Center(
                   child: Text(
                     "Nenhum produto encontrado",
                     style: TextStyle(color: TextColor.colorSecondaryB),
                   ));
             }

             return ListView.builder(
                 shrinkWrap: true,
                 itemCount: controller.computedProducts.length,
                 controller: _scrollController,
                 itemBuilder: (_, index) {
                   ProductModel productModel = controller.computedProducts[index]!;

                   return CardProduct(productModel: productModel);
                 });
           }))
          ],
        ));
  }
}
