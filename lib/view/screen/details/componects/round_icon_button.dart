import 'package:animation_ecommerce_app/utils/constants.dart';
import 'package:flutter/material.dart';

MaterialButton roundIconBtn(
    {required IconData iconData,
     Color? color,
    required VoidCallback press}) {
  return MaterialButton(
    padding: EdgeInsets.zero,
    shape: const CircleBorder(),
    elevation: 0,
    color: Colors.white,
    height: 36,
    minWidth: 36,
    onPressed: press,
    child: Icon(
      iconData,
      color: color??primaryColor,
    ),
  );
}
