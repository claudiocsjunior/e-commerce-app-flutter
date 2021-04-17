import 'dart:async';

import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/submodules/stock/stock_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class StockPage extends StatefulWidget {
  final String title;

  const StockPage({Key? key, this.title = "StockPage"}) : super(key: key);

  @override
  StockPageState createState() => StockPageState();
}

class StockPageState extends ModularState<StockPage, StockStore> {
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
    controller.initValues();

    var timer = Timer(Duration(seconds: 2), () {
      controller.setTotal();
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
      title: "Estoque",
      bottomNavigationindexSelected: PageEnumBottomNav.stock.index,
      floatingAction: false,
      functionFloatingAction: () {},
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
          Observer(builder: (_){
            if(controller.total == null){
              return Center(
                child: RefreshProgressIndicator(),
              );
            }

            return Center(
              child: Text("Estoque total: " + controller.total.toString(), style: TextStyle(fontSize: TextSize.normal),),
            );
          }),
          Expanded(child: Observer(builder: (_) {
            if (controller.productList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.productList!.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.productList!.hasError) {
              return Center(
                child: ElevatedButton(
                  onPressed: controller.getList(),
                  child: Text(
                    "Tente novamente",
                    style: TextStyle(fontSize: TextSize.normal),
                  ),
                ),
              );
            }


            if (controller.computedProducts.length == 0) {
              return Center(
                  child: Text("Nenhuma categoria cadastrada", style: TextStyle(color: TextColor.colorSecondaryB),)
              );
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.computedProducts.length,
                controller: _scrollController,
                itemBuilder: (_, index) {
                  ProductModel productModel =
                  controller.computedProducts[index]!;

                  return ListTile(
                    title: Text(
                      productModel.name!,
                      style: TextStyle(fontSize: TextSize.normal),
                    ),
                    subtitle: Text(
                      "disponível: " + productModel.quantity.toString(),
                      style: TextStyle(
                          fontSize: TextSize.normal,
                          color: TextColor.colorSecondary),
                    ),
                    // leading: Container(
                    //     width: 60,
                    //     child: Image.file(
                    //       productModel.image!,
                    //       fit: BoxFit.fill,
                    //     )),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: TextColor.colorSecondary,
                      ),
                      onPressed: () {
                        controller.setQuantityDefault(productModel.quantity);
                        _showDialog(productModel);
                      },
                    ),
                  );
                });
          }))
        ],
      ),
    );
  }

  _showDialog(ProductModel productModel) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(productModel.name!),
          content: Observer(builder: (_){
            controller.setProduct(productModel);

            return TextFormField(
              initialValue: controller.productSelected!.quantity.toString(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Valor",
              ),
              onChanged: (value) => controller.setProductQuantity(productModel, value),
            );
          },),
          actions: [
            TextButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  controller.updateQuantity(productModel);
                  Modular.to.pop();
                },
                child: Text("Alterar")),
          ],
        );
      },
    );
  }
}
