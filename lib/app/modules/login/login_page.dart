import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = "LoginPage"}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginStore> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (_){
          if(!controller.loading){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultLogin(),
                OtherLogin(),
                Register(),
              ],
            );
          }else{
            return CircularProgressIndicator();
          }
        })
      ),
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
              validator: (String? value) {
                String v = value == null ? "" : value;

                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(v);
                if (v.length == 0) {
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
              onPressed: (){
                if (_formkey.currentState!.validate()) {
                  controller.setErro("");
                  controller.loginEmailAndPassword();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            Observer(builder: (_) {
              if (controller.erro.toString().length > 0) {
                return Text(
                  "${controller.erro.toString()}",
                  style: TextStyle(
                    color: TextColor.colorDanger,
                    fontSize: TextSize.normal,
                  ),
                  textAlign: TextAlign.start,
                );
              }

              return Container();
            }),
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
          height: 1,
          color: BackgroundColor.colorSecondary,
        ),
        SizedBox(
          height: 10,
        ),
        MaterialButton(
          height: 50,
          minWidth: MediaQuery.of(context).size.width - 40,
          color: BackgroundColor.colorDanger,
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
                  decoration: TextDecoration.underline),
            ),
          ),
        )
      ],
    );
  }
}
