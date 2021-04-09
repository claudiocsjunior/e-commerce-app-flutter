import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_store.dart';


class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "RegisterPage"}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  final _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultLogin()
            ],
          )),
    );
  }

  Widget DefaultLogin() {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Text(
              "CADASTRE-SE",
              style: TextStyle(
                color: TextColor.colorSecondary,
                fontSize: TextSize.large,
              ),
            ),
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
                if (value == null || value.isEmpty){
                  return 'Por favor, preencha o campo para continuar.';
                }

                return null;
              },
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
                  return 'Por favor, preencha o campo para continuar.';
                }

                return null;
              },
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
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
              onPressed: controller.register,
            ),
          ],
        ),
      ),
    );
  }
}