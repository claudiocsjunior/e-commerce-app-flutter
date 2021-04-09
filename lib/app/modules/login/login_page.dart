import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title = "LoginPage"}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultLogin(),
          Register(),
          OtherLogin()
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
              "LOGIN",
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
                if (value == null || value.isEmpty) {
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
                if (value == null || value.isEmpty) {
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
                "Login",
                style: TextStyle(
                  color: TextColor.colorPrimary,
                  fontSize: TextSize.normal,
                ),
              ),
              onPressed: controller.loginWithGoogle,
            ),
          ],
        ),
      ),
    );
  }

  Widget OtherLogin() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 20, top: 20),
          width: MediaQuery.of(context).size.width - 40,
          height: 2,
          color: BackgroundColor.colorSecondary,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          height: 50,
          minWidth: MediaQuery.of(context).size.width - 40,
          color: BackgroundColor.colorGmail,
          child: Text(
            "Login com o Gmail",
            style: TextStyle(
              color: TextColor.colorPrimary,
              fontSize: TextSize.normal,
            ),
          ),
          onPressed: controller.loginWithGoogle,
        ),
      ],
    );
  }

  Widget Register() {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: controller.toRegister,
          child: Container(
            child: Text(
              "Cadastre-se",
              style: TextStyle(
                  color: TextColor.colorPrimaryB,
                  fontSize: TextSize.normal,
                  decoration: TextDecoration.underline
              ),
            ),
          ),
        )
      ],
    );
  }
}
