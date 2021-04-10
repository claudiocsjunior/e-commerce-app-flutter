import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/home/home.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/logout/logout.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/settings/setting.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/users/users.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/seller_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sellers_store.dart';
import 'dart:core';

class SellersPage extends StatefulWidget {
  final String title;

  const SellersPage({Key key, this.title = "SellersPage"}) : super(key: key);

  @override
  SellersPageState createState() => SellersPageState();
}

class SellersPageState extends ModularState<SellersPage, SellersStore> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Vendedores"),
        actions: [
          Home(),
          Settings(),
          Logout(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: TextColor.colorPrimary,
          ),
        ),
        onPressed: () => _showDialog(null),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - kToolbarHeight,
        child: Column(
          children: [
            Container(
              height: 0.2 * (MediaQuery.of(context).size.height - kToolbarHeight),
              child: Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.center,
                color: BackgroundColor.colorDanger,
                padding: EdgeInsets.all(10),
                child: Text("OBS.: Além da adição por esta funcionalidade é necessário que o usuário realize seu cadastro no sistema com o mesmo email, para que o vinculo seja realizado com sucesso.", style: TextStyle(color: TextColor.colorPrimary, fontSize: TextSize.normal, ), textAlign: TextAlign.justify,
                ),
              ),
            ),
            Expanded(
              child: Observer(builder: (_) {
                if (controller.sellerList.hasError) {
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

                if (controller.sellerList.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                List<SellerModel> listSeller = controller.sellerList.data;

                return ListView.builder(
                    itemCount: listSeller.length,
                    itemBuilder: (_, index) {
                      SellerModel sellerModel = listSeller[index];

                      return ListTile(
                        title: Text(
                          sellerModel.email,
                          style: TextStyle(fontSize: TextSize.normal),
                        ),
                        leading: IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: TextColor.colorDanger,
                          ),
                          onPressed: () => {controller.delete(sellerModel)},
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: TextColor.colorWarning,
                          ),
                          onPressed: () => _showDialog(sellerModel),
                        ),
                        onLongPress: () => {controller.delete(sellerModel)},
                      );
                    });
              }),
            )
          ],
        ),
      )
    );
  }

  _showDialog(SellerModel seller) {
    bool isNull = false;
    if (seller == null) {
      isNull = true;
      seller = SellerModel();
    }

    showDialog(
      context: context,
      builder: (_) {
        return Form(
          key: _formkey,
          child: AlertDialog(
            title: Text(isNull ? "Novo Vendedor" : "Editar Vendedor"),
            content: TextFormField(
              initialValue: seller.email,
              onChanged: (value) => seller.email = value.trim(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Insira o email...",
              ),
              validator: (value) {
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (value.length == 0) {
                  return "Informe o Email";
                } else if (!emailValid) {
                  return "Email inválido";
                } else {
                  return null;
                }

                return null;
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
                    if (_formkey.currentState.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Aguarde')));

                      controller.save(seller);
                      Modular.to.pop();
                    }
                  },
                  child: Text("Finalizar")),
            ],
          ),
        );
      },
    );
  }
}
