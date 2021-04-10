import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../seller_store.dart';

class Logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon: Icon(Icons.logout),
        onPressed: Modular.get<SellerStore>().LogOut);
  }
}
