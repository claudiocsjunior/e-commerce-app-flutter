import 'package:e_commerce_app/app/modules/seller/enums/page-enum-bottom-nav.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/dash-board/dash-board.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:e_commerce_app/app/shared/models/category_model.dart';
import 'package:e_commerce_app/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'create_store.dart';

class CreatePage extends StatefulWidget {
  final String title;

  const CreatePage({Key key, this.title = "CreatePage"}) : super(key: key);

  @override
  CreatePageState createState() => CreatePageState();
}

class CreatePageState extends ModularState<CreatePage, CreateStore> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DashBoard(
      title: "Novo Produto",
      bottomNavigationindexSelected: PageEnumBottomNav.product.index,
      floatingAction: false,
      functionFloatingAction: () => () {},
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: [SelectImage(), FormProduct()],
          ),
        ),
      ),
    );
  }

  Widget SelectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width - 40,
          height: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 2.0, color: BackgroundColor.colorSecondary)),
          child: Observer(builder: (_) {
            if (controller.image == null) {
              return Text(
                "Nenhum imagem selecionada",
                style: TextStyle(
                  fontSize: TextSize.normal,
                ),
              );
            }

            return Image.file(
              controller.image,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.width * 0.75,
            );
          }),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: controller.getImageGalery,
                child: Row(
                  children: [
                    Icon(
                      Icons.folder_open,
                      color: TextColor.colorPrimary,
                    ),
                    Text(
                      "Buscar imagem",
                      style: TextStyle(color: TextColor.colorPrimary),
                    )
                  ],
                ),
                color: BackgroundColor.colorSuccess,
              ),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                onPressed: controller.getImageCamera,
                child: Row(
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      color: TextColor.colorPrimary,
                    ),
                    Text(
                      "Tirar Foto",
                      style: TextStyle(color: TextColor.colorPrimary),
                    )
                  ],
                ),
                color: BackgroundColor.colorSuccess,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget FormProduct(){
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Observer(builder: (_){
            if (controller.categoryList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.categoryList.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.categoryList.hasError) {
              return Center(
                child: ElevatedButton(
                  onPressed: controller.getListCategory,
                  child: Text(
                    "Tente novamente",
                    style: TextStyle(fontSize: TextSize.normal),
                  ),
                ),
              );
            }

            List<CategoryModel> listCategory = controller.categoryList.data;

            return DropdownButton<CategoryModel>(
              value: controller.categorySelected,
              hint: Text("Selecione a categoria",
                  style: TextStyle(color: BackgroundColor.colorPrimary)
              ),
              icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.chevron_right, color: BackgroundColor.colorPrimary)
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: BackgroundColor.colorPrimary),
              underline: Container(
                height: 2,
                color: BackgroundColor.colorPrimary,
              ),
              onChanged: (CategoryModel categoryModel) {
                controller.setCategorySelected(categoryModel);
              },
              items: listCategory.map<DropdownMenuItem<CategoryModel>>((CategoryModel categoryModel) {
                return DropdownMenuItem<CategoryModel>(
                  value: categoryModel,
                  child: Text(categoryModel.description),
                );
              }).toList(),
            );
          }),
          Observer(builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                initialValue: controller.productModel.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.all_inbox),
                  hintText: "Nome",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o nome';
                  }

                  if (value.length < 3) {
                    return 'O nome deve conter ao menos 3 caracteres';
                  }

                  return null;
                },
                onChanged: (value) => controller.setName(value),
              ),
            );
          }),
          Observer(builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                initialValue: controller.productModel.description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.subtitles),
                  hintText: "Descrição",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe a descrição';
                  }

                  if (value.length < 3) {
                    return 'A descrição deve conter ao menos 3 caracteres';
                  }

                  return null;
                },
                onChanged: (value) => controller.setDescription(value),
              ),
            );
          }),
          Observer(builder: (_) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: controller.productModel.description,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.monetization_on_rounded),
                  hintText: "Valor",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Informe o valor do produto';
                  }

                  return null;
                },
                onChanged: (value) => controller.setPrice(double.parse(value)),
              ),
            );
          }),
          Error(),
          Observer(builder: (_) {
            if (controller.loading) {
              return Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                margin: EdgeInsets.only(top: 20),
                child: MaterialButton(
                  height: 30,
                  minWidth:
                  MediaQuery.of(context).size.width - 40,
                  color: BackgroundColor.colorSuccess,
                  child: Text(
                    "Finalizar",
                    style: TextStyle(
                      color: TextColor.colorPrimary,
                      fontSize: TextSize.normal,
                    ),
                  ),
                  onPressed: () {
                    controller.setError("");

                    if (controller.image == null) {
                      controller.setError("É necessário selecionar uma imagem");
                      return;
                    }

                    if (controller.categorySelected == null) {
                      controller.setError("É necessário selecionar a categoria");
                      return;
                    }

                    if (_formkey.currentState.validate()) {
                      controller.saveProduct();
                    }
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget Error() {
    return Observer(builder: (_) {
      if (controller.error == "" || controller.error == null) {
        return Container();
      } else {
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Text(
            controller.error,
            style: TextStyle(
                color: TextColor.colorDanger, fontSize: TextSize.normal),
          ),
        );
      }
    });
  }
}
