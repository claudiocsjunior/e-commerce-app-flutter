import 'package:e_commerce_app/app/modules/seller/category/category_store.dart';
import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/logout/logout.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/settings/setting.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/users/users.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key? key, this.title = "CategoryPage"}) : super(key: key);

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends ModularState<CategoryPage, CategoryStore> {
  @override
  void initState() {
    super.initState();
    controller.initValues();
  }

  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "Categorias",
      bottomNavigationindexSelected: PageEnumBottomNav.category.index,
      floatingAction: true,
      functionFloatingAction: () => _showDialog(null),
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
              child: Text("Nenhuma categoria cadastrada", style: TextStyle(color: TextColor.colorSecondaryB),)
          );
        }


        return ListView.builder(
            itemCount: listCategory.length,
            itemBuilder: (_, index) {
              CategoryModel categoryModel = listCategory[index];

              return ListTile(
                title: Text(
                  categoryModel.description,
                  style: TextStyle(fontSize: TextSize.normal),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: TextColor.colorDanger,
                  ),
                  onPressed: () => {controller.delete(categoryModel)},
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: TextColor.colorWarning,
                  ),
                  onPressed: () => _showDialog(categoryModel),
                ),
                onLongPress: () => {controller.delete(categoryModel)},
              );
            });
      }),
    );
  }

  _showDialog(CategoryModel? category) {
    bool isNull = false;
    if (category == null) {
      isNull = true;
      category = CategoryModel();
    }

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(isNull ? "Nova Categoria" : "Editar Categoria"),
          content: TextFormField(
            initialValue: category!.description,
            onChanged: (value) => category!.description = value,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Insira a descrição...",
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text("Cancelar")),
            TextButton(
                onPressed: () {
                  controller.save(category!);
                  Modular.to.pop();
                },
                child: Text("Finalizar")),
          ],
        );
      },
    );
  }
}
