import 'dart:convert';

import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/product/product_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatefulWidget {
  final String title;

  const ProductPage({Key? key, this.title = "ProductPage"}) : super(key: key);

  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends ModularState<ProductPage, ProductStore> {
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 10, // or whatever offset you wish
    keepScrollOffset: true,
  );

  final snackBarLoading = SnackBar(
      duration: Duration(milliseconds: 500),
      content: Container(
          alignment: Alignment.center,
          height: 30,
          width: 5,
          child: CircularProgressIndicator()));

  @override
  void initState() {
    super.initState();
    controller.initValues();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ScaffoldMessenger.of(context).showSnackBar(snackBarLoading);
        controller.getList();
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
      title: "Produtos",
      bottomNavigationindexSelected: PageEnumBottomNav.product.index,
      floatingAction: true,
      functionFloatingAction: controller.toCreateProduct,
      body: Column(
        children: [
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:           Observer(builder: (_) {
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: TextFormField(
                  initialValue: controller.search,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.search),
                    hintText: "Nome",
                  ),
                  onChanged: (value) => controller.setSearch(value),
                ),
              );
            }),
          ),
          Expanded(child: Observer(builder: (_) {
            if (controller.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.computedProducts.length == 0) {
              return Center(
                  child: Text(
                "Nenhum produto cadastrado",
                style: TextStyle(color: TextColor.colorSecondaryB),
              ));
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.computedProducts.length,
                controller: _scrollController,
                itemBuilder: (_, index) {
                  ProductModel productModel = controller.computedProducts[index]!;

                  return ListTile(
                    title: Text(
                      productModel.name!,
                      style: TextStyle(fontSize: TextSize.normal),
                    ),
                    subtitle: Text(
                      productModel.categoryModel!.description,
                      style: TextStyle(fontSize: TextSize.normal),
                    ),
                    leading: Image.file(
                      productModel.image!,
                      fit: BoxFit.fill,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: TextColor.colorSecondary,
                      ),
                      onPressed: () => modalBottomSheet(productModel),
                    ),
                    onLongPress: () => {controller.delete(productModel)},
                  );
                });
          }))
        ],
      ),
    );
  }

  void modalBottomSheet(ProductModel productModel) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Text(productModel.name!,
                          style: TextStyle(fontSize: TextSize.large)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Text(productModel.description!,
                          style: TextStyle(
                              fontSize: TextSize.normal,
                              color: TextColor.colorSecondaryB)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Text(
                          "Categoria: " +
                              productModel.categoryModel!.description,
                          style: TextStyle(
                              fontSize: TextSize.normal,
                              color: TextColor.colorSecondaryB)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Text("Preço: " + productModel.price.toString(),
                          style: TextStyle(
                              fontSize: TextSize.normal,
                              color: TextColor.colorSecondaryB)),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: BackgroundColor.colorSecondary,
                ),
                ListTile(
                    leading: new Icon(
                      Icons.edit,
                      color: TextColor.colorWarning,
                    ),
                    title: new Text('Editar'),
                    onTap: () {
                      Modular.to.pop();
                      controller.toEditProduct(productModel);
                    }),
                ListTile(
                  leading: new Icon(
                    Icons.delete_forever,
                    color: TextColor.colorDanger,
                  ),
                  title: new Text('Excluir'),
                  onTap: () {
                    controller.delete(productModel);
                    controller.getList();
                    Modular.to.pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
