import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/product/product_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatefulWidget {
  final String title;
  const ProductPage({Key key, this.title = "ProductPage"}) : super(key: key);
  @override
  ProductPageState createState() => ProductPageState();
}
class ProductPageState extends ModularState<ProductPage, ProductStore> {
  @override
  void initState() {
    super.initState();
    preencherTela();
  }

  Future<bool> preencherTela() async {
    await Future.delayed(Duration(seconds: 1));
    await controller.getList();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "Produtos",
      bottomNavigationindexSelected: PageEnumBottomNav.product.index,
      floatingAction: true,
      functionFloatingAction: () => () {},
      body: Observer(builder: (_) {
        if (controller.productList == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.productList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.productList.hasError) {
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

        List<ProductModel> listProduct = controller.productList.data;

        return ListView.builder(
            itemCount: listProduct.length,
            itemBuilder: (_, index) {
              ProductModel productModel = listProduct[index];

              return ListTile(
                title: Text(
                  productModel.name,
                  style: TextStyle(fontSize: TextSize.normal),
                ),
                subtitle: Text(
                  "Categoria: " + productModel.categoryModel.description,
                  style: TextStyle(fontSize: TextSize.normal),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: TextColor.colorDanger,
                  ),
                  onPressed: () => {controller.delete(productModel)},
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: TextColor.colorWarning,
                  ),
                  onPressed: () => () {},
                ),
                onLongPress: () => {controller.delete(productModel)},
              );
            });
      }),
    );
  }
}