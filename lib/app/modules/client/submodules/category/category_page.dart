import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'category_store.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key? key, this.title = "CategoryPage"}) : super(key: key);

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends ModularState<CategoryPage, CategoryStore> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initValues();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
        titulo: "Categorias",
        body: Observer(builder: (_) {
          if (controller.categoryList == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.categoryList!.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (controller.categoryList!.hasError) {
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

          List<CategoryModel> listCategory = controller.categoryList!.data;

          if (listCategory.length == 0) {
            return Center(
                child: Text(
              "Nenhuma categoria disponível",
              style: TextStyle(color: TextColor.colorSecondaryB),
            ));
          }

          return ListView.builder(
              itemCount: listCategory.length,
              itemBuilder: (_, index) {
                CategoryModel categoryModel = listCategory[index];

                return ListTile(
                  onTap: () {Modular.get<ClientStore>().toHomeByCategory(categoryModel);},
                  title: Text(
                    categoryModel.description,
                    style: TextStyle(fontSize: TextSize.normal),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: TextColor.colorSecondaryB,
                  ),
                );
              });
        }));
  }
}
