import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigation extends StatelessWidget {
  int currentIndex = 0;

  BottomNavigation({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: Modular.get<SellerStore>().toHomePage,
          ),
          title: Text("Inicio"),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: Modular.get<SellerStore>().toCategoty,
          ),
          title: Text("Categorias"),
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: Modular.get<SellerStore>().toCategoty,
          ),
          title: Text("Produtos"),
        ),
      ],
    );
  }
}
