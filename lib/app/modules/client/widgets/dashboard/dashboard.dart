import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-options/drawer-options.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-widget/drawer-widget.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DashBoard extends StatelessWidget {
  String titulo;
  Widget body;

  DashBoard({required this.titulo, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
          actions: [
            InkWell(
              onTap: Modular.get<ClientStore>().toCartSales,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(Icons.shopping_cart),
                  Positioned(
                    top: 35,
                    left: 10,
                    child: Container(
                      width: 20,
                      height: 18,
                      color: BackgroundColor.colorPrimary,
                      child: Observer(builder: (_){
                        if(Modular.get<ClientStore>().productsCart == null){
                            return RefreshProgressIndicator(
                              backgroundColor: BackgroundColor.colorWhite,
                            );
                        }


                        return Text(
                          Modular.get<ClientStore>().productsCart.toString(),
                          style: TextStyle(
                              fontSize: TextSize.small,
                              color: TextColor.colorPrimary),
                        );
                      },),
                    )
                  )
                ],
              ),
            ),
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: Modular.get<ClientStore>().LogOut)
          ],
        ),
        drawer: Observer(
          builder: (_) {
            return DrawerWidget(
                name: Modular.get<ClientStore>().name,
                email: Modular.get<ClientStore>().email,
                child: DrawerOptions());
          },
        ),
        body: body);
  }
}
