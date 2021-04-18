import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'finalized-sales_store.dart';

class FinalizedSalesPage extends StatefulWidget {
  final String title;
  const FinalizedSalesPage({Key? key, this.title = "FinalizedSalesPage"}) : super(key: key);
  @override
  FinalizedSalesPageState createState() => FinalizedSalesPageState();
}
class FinalizedSalesPageState extends ModularState<FinalizedSalesPage, FinalizedSalesStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(
        titulo: "Minhas Compras",
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Observer(builder: (_) {
                if (controller.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.salesCart.length == 0) {
                  return Center(
                      child: Text(
                        "Nenhum produto comprado",
                        style: TextStyle(color: TextColor.colorSecondaryB),
                      ));
                }

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.salesCart.length,
                    itemBuilder: (_, index) {
                      SaleModel saleModel = controller.salesCart[index];

                      return ListTile(
                        title: Text(
                          saleModel.productModel!.name!,
                          style: TextStyle(fontSize: TextSize.normal),
                        ),
                        subtitle: Text(
                          "Quantidade: " + saleModel.quantity.toString(),
                          style: TextStyle(fontSize: TextSize.normal),
                        ),
                        leading: Container(
                            width: 60,
                            child: Image.file(
                              saleModel.productModel!.image!,
                              fit: BoxFit.fill,
                            )),
                      );
                    });
              }))
         );
  }
}