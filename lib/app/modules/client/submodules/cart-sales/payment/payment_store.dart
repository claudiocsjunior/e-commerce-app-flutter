import 'package:e_commerce_app/app/modules/client/client_store.dart';
import 'package:e_commerce_app/app/modules/client/submodules/cart-sales/cart-sales_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:mobx/mobx.dart';

part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;
abstract class _PaymentStoreBase with Store {

  @observable
  bool loading = false;

  @action
  finalizedSales(String typePayment) async {
    List<String> products = List.generate(0, (index) => '');

    loading = true;
    products = await Modular.get<CartSalesStore>().finalizedSales();
    Modular.get<ClientStore>().getProductsCart();
    Modular.get<ClientStore>().toFinalizedSales();

    await sendEmail(products, typePayment);
    loading = false;
  }

  sendEmail(products, String typePayment) async{
    String username = 'ecommerce.app.mobile@gmail.com';
    String password = 'Senha@123';

    final smtpServer = gmail(username, password);

    String content = "";
    for(String product in products){
      content = content + product;
    }

    final message = Message()
      ..from = Address(username)
      ..recipients.add(Modular.get<ClientStore>().email.trim())
      ..subject = 'Compra Finalizada - E-commerce-app'
      ..text = 'Sua compra foi finalizada com sucesso!!!'
      ..html = "<h1>Dados da compra</h1>\n<h3>Tipo do pagamento: $typePayment</h3>\n<h3>Produtos:</h3>\n$content";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print(e);
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

}