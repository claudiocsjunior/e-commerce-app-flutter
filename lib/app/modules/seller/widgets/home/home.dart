import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../seller_store.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon: Icon(Icons.home),
        onPressed: Modular.get<SellerStore>().toHomePage);
  }
}
