import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/sale_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../client_store.dart';
import 'cart-sales_store.dart';

class CartSalesPage extends StatefulWidget {
  final String title;

  const CartSalesPage({Key? key, this.title = "CartSalesPage"})
      : super(key: key);

  @override
  CartSalesPageState createState() => CartSalesPageState();
}

class CartSalesPageState extends ModularState<CartSalesPage, CartSalesStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(
        titulo: "Carrinho",
        body: Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Observer(builder: (_) {
                if (controller.loading) {
                  return Container();
                }

                if (controller.salesCart.length == 0) {
                  return Container();
                }

                return MaterialButton(
                  height: 30,
                  minWidth: MediaQuery.of(context).size.width - 40,
                  color: BackgroundColor.colorSuccess,
                  child: Text(
                    "Finalizar compra",
                    style: TextStyle(
                      color: TextColor.colorPrimary,
                      fontSize: TextSize.normal,
                    ),
                  ),
                  onPressed: Modular.get<ClientStore>().toPayment,
                );
              }),
              Expanded(child: Observer(builder: (_) {
                if (controller.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (controller.salesCart.length == 0) {
                  return Center(
                      child: Text(
                    "Nenhum produto encontrado",
                    style: TextStyle(color: TextColor.colorSecondaryB),
                  ));
                }

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.salesCart.length,
                    itemBuilder: (_, index) {
                      SaleModel saleModel = controller.salesCart[index];

                      return ListTile(
                        onTap: () {
                          controller.setSaleCartSelected(saleModel);
                          controller.setQuantitySelected(
                              controller.saleCartSalected.quantity!);
                          _showDialog(saleModel);
                        },
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
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: TextColor.colorSecondary,
                          ),
                          onPressed: () async {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Aguarde'),
                                backgroundColor: BackgroundColor.colorPrimary,
                                duration: Duration(seconds: 1)));
                            await controller.removeSaleCart(saleModel);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Produto removido'),
                                backgroundColor: BackgroundColor.colorPrimary,
                                duration: Duration(seconds: 1)));
                          },
                        ),
                      );
                    });
              }))
            ],
          ),
        ));
  }

  _showDialog(SaleModel saleModel) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Alterar quantidade"),
          content: Observer(
            builder: (_) {
              return Container(
                height: 100,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: controller.saleQuantity.toString(),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Valor",
                      ),
                      onChanged: (value) => controller.setSaleQuantity(value),
                    ),
                    Observer(builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          controller.error,
                          style: TextStyle(color: TextColor.colorDanger),
                        ),
                      );
                    })
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  controller.updateQuantity();
                  controller.getData();
                  Modular.to.pop();
                },
                child: Text("Alterar")),
          ],
        );
      },
    );
  }
}
