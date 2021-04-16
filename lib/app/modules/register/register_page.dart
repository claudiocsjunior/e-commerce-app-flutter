import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_store.dart';


class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = "RegisterPage"}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "CADASTRE-SE",
          style: TextStyle(
            color: TextColor.colorPrimary,
          ),
        ),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                if(!controller.validateForm) {
                  return DefaultRegister();
                }else if(controller.erro.toString().length > 0){
                  return DefaultRegister();
                }else{
                  return CircularProgressIndicator();
                }
              })
            ],
          )),
    );
  }

  Widget DefaultRegister() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.mail),
                hintText: "Email",

              ),

              validator: (value) {
                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                if (value.length == 0) {
                  return "Informe o Email";
                } else if(!emailValid){
                  return "Email inválido";
                }else {
                  return null;
                }

                return null;
              },
              onChanged: (value) => controller.setEmail(value),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.lock),
                hintText: "Senha",
              ),

              validator: (value) {
                if (value == null || value.isEmpty){
                  return 'Informe a senha';
                }

                if (value.length < 6){
                  return 'A senha deve conter ao menos 6 caracteres';
                }

                return null;
              },
              onChanged: (value) => controller.setPassword(value),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.lock),
                hintText: "Confirmar senha",
              ),

              validator: (value) {
                if (value == null || value.isEmpty){
                  return 'Confirme a senha';
                }

                return null;
              },
              onChanged: (value) => controller.setPasswordConfirm(value),
            ),
            Observer(builder: (_){
              if(!controller.validateForm){
                return Text(
                  "${controller.textConfirm}",
                  style: TextStyle(
                    color: controller.colorConfirm,
                    fontSize: TextSize.normal,
                  ),
                  textAlign: TextAlign.start
                  ,
                );
              }

              return Container();

            }),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (_){
              return MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width - 40,
                color: BackgroundColor.colorPrimary,
                child: Text(
                  "Finalizar Cadastro",
                  style: TextStyle(
                    color: TextColor.colorPrimary,
                    fontSize: TextSize.normal,
                  ),
                ),
                onPressed: () {
                  if(controller.password != controller.passwordConfirm){
                    return;
                  }

                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Aguarde')));
                    controller.setErro("");
                    controller.setValidateForm(true);
                    controller.register();
                  }
                },
              );
            }),
            Observer(builder: (_){
              if(controller.erro.toString().length > 0){
                return Text(
                  "${controller.erro.toString()}",
                  style: TextStyle(
                    color: TextColor.colorDanger,
                    fontSize: TextSize.normal,
                  ),
                  textAlign: TextAlign.start
                  ,
                );
              }

              return Container();

            }),

          ],
        ),
      ),
    );
  }
}