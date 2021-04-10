import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../seller_store.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  IconButton(icon: Icon(Icons.settings),
        onPressed: Modular.get<SellerStore>().toSettings);
    }
}
