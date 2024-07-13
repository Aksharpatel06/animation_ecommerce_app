import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../controller/home_controller.dart';

Container cardShortView(BuildContext context, HomeController controller) {
  return Container(
    padding: const EdgeInsets.all(defaultPadding),
    color: const Color(0xFFEAEAEA),
    child: Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(width: defaultPadding),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.cart.length,
                    (index) => Padding(
                  padding: const EdgeInsets.only(right: defaultPadding / 2),
                  child: Hero(
                    tag: "${controller.cart[index].productModal!.title!}_cartTag",
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                      AssetImage(controller.cart[index].productModal!.image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            controller.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        )
      ],
    ),
  );
}
