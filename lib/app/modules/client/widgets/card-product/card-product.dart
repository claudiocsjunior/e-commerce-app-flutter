import 'dart:io';

import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class CardProduct extends StatelessWidget {
  ProductModel productModel;

  CardProduct({required this.productModel});


  @override
  Widget build(BuildContext context) {
    return
      Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 600,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2.0, color: BackgroundColor.colorSecondary),
          ),
          child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 80,
                    child: Text(
                      productModel.name!,
                      style: TextStyle(
                          color: TextColor.colorSecondaryB,
                          fontSize: TextSize.medium),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 1,
                    color: BackgroundColor.colorSecondary,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20, right: 30, left: 30, bottom: 10),
                    alignment: Alignment.center,
                    height: 300,
                    child: Image.file(
                      productModel.image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 60,
                    child: Text(
                      productModel.description!,
                      style: TextStyle(
                          color: TextColor.colorSecondaryB,
                          fontSize: TextSize.normal),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 20,
                    child: Text(
                      "Disponível: " + productModel.quantity.toString() +
                          " unidades",
                      style: TextStyle(
                          fontSize: TextSize.small),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 40,
                    child: Text(
                      NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
                          .format(productModel.price)
                          .toString(),
                      style: TextStyle(
                          color: TextColor.colorSuccess,
                          fontSize: TextSize.medium),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 1,
                    color: BackgroundColor.colorSecondary,
                  ),
                  ListTile(
                    onTap: () async{
                    ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Aguarde'), backgroundColor: BackgroundColor.colorPrimary, duration: Duration(seconds: 1),));
                    await Modular.get <ClientStore>().addProductCart(productModel);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Produto adicionado no carrinho'), backgroundColor: BackgroundColor.colorPrimary, duration: Duration(milliseconds: 500)));
                  },
                    title: Text(
                      "Adicionar ao carrinho",
                      style: TextStyle(
                          fontSize: TextSize.normal,
                          color: TextColor.colorSecondaryB),
                    ),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  )
                ],
              )));
  }
}
