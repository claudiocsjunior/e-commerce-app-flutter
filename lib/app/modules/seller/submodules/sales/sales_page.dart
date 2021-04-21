import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sales_store.dart';

class SalesPage extends StatefulWidget {
  final String title;
  const SalesPage({Key? key, this.title = "SalesPage"}) : super(key: key);
  @override
  SalesPageState createState() => SalesPageState();
}
class SalesPageState extends ModularState<SalesPage, SalesStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(title: "Vendas",
      bottomNavigationindexSelected: PageEnumBottomNav.sale.index,
      floatingAction: false,
      functionFloatingAction: (){},
      body: Observer(builder: (_) {
        if (controller.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.salesCart.length == 0) {
          return Center(
              child: Text(
                "Nenhum produto vendido",
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
      }),);
  }
}