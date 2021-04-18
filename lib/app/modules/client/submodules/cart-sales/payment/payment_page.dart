import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/payment/payment_store.dart';
import 'package:e_commerce_app/app/modules/client/widgets/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PaymentPage extends StatefulWidget {
  final String title;

  const PaymentPage({Key? key, this.title = "PaymentPage"}) : super(key: key);

  @override
  PaymentPageState createState() => PaymentPageState();
}

class PaymentPageState extends ModularState<PaymentPage, PaymentStore> {
  @override
  Widget build(BuildContext context) {
    return DashBoard(titulo: "Forma de pagamento", body: ListView(
      children: [
        ListTile(
          title: Text("Cartão de Credito"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            onTap: controller.finalizedSales();
          },
        ),
        ListTile(
          title: Text("Cartão de Débito"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            onTap: controller.finalizedSales();
          },
        ),
        ListTile(
          title: Text("Boleto"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            onTap: controller.finalizedSales();
          },
        ),
        ListTile(
          title: Text("Pix"),
          trailing: Icon(Icons.arrow_right),
          onTap: (){
            onTap: controller.finalizedSales();
          },
        ),
      ],
    ));
  }
}
