import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../seller_store.dart';

class Users extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon: Icon(Icons.group_add_outlined),
        onPressed: Modular.get<SellerStore>().toSellers);
  }
}
