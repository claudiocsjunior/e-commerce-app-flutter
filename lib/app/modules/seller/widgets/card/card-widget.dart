import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  Color color1;
  Color color2;
  Color color3;
  IconData icon;
  String title;
  Widget content;
  Function onPress;

  CardWidget({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.icon,
    required this.title,
    required this.content,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {onPress();},
      child: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
          gradient: new LinearGradient(
            colors: [
              color1,
              color2,
              color3,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              width: 2.0, color: BackgroundColor.colorSecondary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(

              width: (MediaQuery.of(context).size.width - 50) * 0.5,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 60, color: Colors.white,),
                  Text(title, style: TextStyle(fontSize: TextSize.medium, color: Colors.white),)
                ],
              ),
            ),
            content
          ],
        ),
      ),
    );
  }
}
