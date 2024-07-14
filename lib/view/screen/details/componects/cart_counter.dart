import 'package:animation_ecommerce_app/view/screen/details/componects/round_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

Container cartCounter() {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xFFF6F6F6),
      borderRadius: const BorderRadius.all(Radius.circular(40)),
    ),
    child: Row(
      children: [
        roundIconBtn(
          iconData: Icons.remove,
          color: Colors.black38,
          press: () {
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 4),
          child: Text(
            "1",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800),
          ),
        ),
        roundIconBtn(
          iconData: Icons.add,
          press: () {}, color: null,
        ),
      ],
    ),
  );
}
