import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-options/drawer-options.dart';
import 'package:e_commerce_app/app/modules/client/widgets/drawer-widget/drawer-widget.dart';
import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'settings_store.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key? key, this.title = "SettingsPage"}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}
class SettingsPageState extends ModularState<SettingsPage, SettingsStore> {
  final _formkey = GlobalKey<FormState>();
  final _formPasswordkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DashBoard(titulo: "Configurações", body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Dados Pessoais",
                        style: TextStyle(fontSize: TextSize.normal),
                      ),
                    ),
                    Observer(builder: (_) {
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextFormField(
                          initialValue: controller.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.person),
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
                          initialValue: controller.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            icon: Icon(Icons.mail),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (value.length == 0) {
                              return "Informe o Email";
                            } else if (!emailValid) {
                              return "Email inválido";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) => controller.setEmail(value),
                        ),
                      );
                    }),
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
                              "Alterar",
                              style: TextStyle(
                                color: TextColor.colorPrimary,
                                fontSize: TextSize.normal,
                              ),
                            ),
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Aguarde')));

                                controller.updateDados();
                              }
                            },
                          ),
                        );
                      }
                    })
                  ],
                ),
              ),
              Error(),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: MediaQuery.of(context).size.width - 40,
                height: 1,
                color: BackgroundColor.colorSecondary,
              ),
              Form(
                key: _formPasswordkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Alterar Senha",
                        style: TextStyle(fontSize: TextSize.normal),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.lock),
                          hintText: "Senha",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Informe a senha';
                          }

                          if (value.length < 6) {
                            return 'A senha deve conter ao menos 6 caracteres';
                          }

                          return null;
                        },
                        onChanged: (value) => controller.setPassword(value),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 20),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.lock),
                          hintText: "Confirmar senha",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirme a senha';
                          }

                          return null;
                        },
                        onChanged: (value) =>
                            controller.setConfirmPassword(value),
                      ),
                    ),
                    Observer(builder: (_) {
                      if (controller.textConfirm != null &&
                          controller.textConfirm != "") {
                        return Text(
                          "${controller.textConfirm}",
                          style: TextStyle(
                            color: controller.colorConfirm,
                            fontSize: TextSize.normal,
                          ),
                          textAlign: TextAlign.start,
                        );
                      }

                      return Container();
                    }),
                    Observer(builder: (_) {
                      if (controller.loadingPassword) {
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
                              "Alterar",
                              style: TextStyle(
                                color: TextColor.colorPrimary,
                                fontSize: TextSize.normal,
                              ),
                            ),
                            onPressed: () {
                              if (controller.password !=
                                  controller.confirmPassword) {
                                return;
                              }

                              if (_formPasswordkey.currentState!
                                  .validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Aguarde')));

                                controller.updatePassword();
                              }
                            },
                          ),
                        );
                      }
                    }),
                    ErrorPassword()
                  ],
                ),
              )
            ],
          ),
        )));
  }

  Widget Error() {
    return Observer(builder: (_) {
      if (controller.error == "" || controller.error == null) {
        return Container();
      } else {
        return Container(
          child: Text(
            controller.error,
            style: TextStyle(
                color: TextColor.colorDanger, fontSize: TextSize.normal),
          ),
        );
      }
    });
  }

  Widget  ErrorPassword() {
    return Observer(builder: (_) {
      if (controller.errorPassword == "" || controller.errorPassword == null) {
        return Container();
      } else {
        return Container(
          child: Text(
            controller.errorPassword,
            style: TextStyle(
                color: TextColor.colorDanger, fontSize: TextSize.normal),
          ),
        );
      }
    });
  }
}