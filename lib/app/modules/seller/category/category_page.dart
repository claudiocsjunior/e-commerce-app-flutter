import 'package:e_commerce_app/app/modules/seller/category/category_store.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/logout.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/setting.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/users.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({Key key, this.title = "CategoryPage"}) : super(key: key);

  @override
  CategoryPageState createState() => CategoryPageState();
}

class CategoryPageState extends ModularState<CategoryPage, CategoryStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
        actions: [
          Settings(),
          Users(),
          Logout(),
        ],
      ),
      bottomNavigationBar: BottomNavigation(
        currentIndex: 1,
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
      body: Observer(builder: (_) {
        if (controller.categoryList.hasError) {
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

        if (controller.categoryList.data == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<CategoryModel> listCategory = controller.categoryList.data;

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

  _showDialog(CategoryModel category) {
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
            initialValue: category.description,
            onChanged: (value) => category.description = value,
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
                  controller.save(category);
                  Modular.to.pop();
                },
                child: Text("Finalizar")),
          ],
        );
      },
    );
  }
}
