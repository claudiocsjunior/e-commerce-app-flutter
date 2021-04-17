import 'package:e_commerce_app/app/shared/config/background-color.dart';
import 'package:e_commerce_app/app/shared/config/text-color.dart';
import 'package:e_commerce_app/app/shared/config/text-size.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  String name;
  String email;
  Widget child;

  DrawerWidget({required this.name, required this.email, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      child: Drawer(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              width: 270,
              height: 200,
              color: BackgroundColor.colorPrimary,
              child: Container(
                height: 100,
                width: 270,
                child: Row(
                  children: [
                    Container(
                      width: 270 * 0.3,
                      alignment: Alignment.center,
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: BackgroundColor.colorWhite,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.person),
                      ),
                    ),
                    Container(
                        width: 270 * 0.6,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: TextSize.normal,
                                  color: TextColor.colorPrimary),
                            ),
                            Text(
                              email,
                              style: TextStyle(
                                  fontSize: TextSize.small,
                                  color: TextColor.colorPrimary),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}
