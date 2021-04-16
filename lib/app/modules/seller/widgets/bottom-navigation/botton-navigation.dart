import 'package:e_commerce_app/app/modules/seller/seller_store.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BottomNavigation extends StatelessWidget {
  int currentIndex = 0;

  BottomNavigation({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.home),
            onPressed: Modular
                .get<SellerStore>()
                .toHomePage,
          ),
          label: "Inicio",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.category_rounded),
            onPressed: Modular
                .get<SellerStore>()
                .toCategoty,
          ),
          label:"Categorias",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: Modular
                .get<SellerStore>()
                .toProduct,
          ),
          label: "Produtos",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.my_library_books),
            onPressed: Modular
                .get<SellerStore>()
                .toHomePage,
          ),
          label: "Estoque",
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.double_arrow_outlined),
            onPressed: Modular
                .get<SellerStore>()
                .toHomePage,
          ),
          label: "Vendas",
        ),
      ],
    );
  }
}
