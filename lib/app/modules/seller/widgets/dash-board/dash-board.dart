import 'package:e_commerce_app/app/modules/seller/widgets/bottom-navigation/botton-navigation.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/logout/logout.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/settings/setting.dart';
import 'package:e_commerce_app/app/modules/seller/widgets/users/users.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  Widget body;
  String title;
  int bottomNavigationindexSelected;
  bool floatingAction;
  Function functionFloatingAction = () => {};

  DashBoard({this.body, this.title = "", this.bottomNavigationindexSelected = 0, this.floatingAction = false, this.functionFloatingAction});

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Settings(),
          Users(),
          Logout(),
        ],
      ),
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavigation(
        currentIndex: widget.bottomNavigationindexSelected,
      ),

      body: widget.body,
    );
  }

  Widget FloatingButton(){
    if(widget.floatingAction){
      return  FloatingActionButton(
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: TextColor.colorPrimary,
          ),
        ),
        onPressed: widget.functionFloatingAction,
      );
    }

    return Container();

  }
}
