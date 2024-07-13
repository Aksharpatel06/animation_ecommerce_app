import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../modal/product_modal.dart';
import '../../componects/favorite_button.dart';
import '../../componects/price.dart';

Container productCard(
    {required ProductModal product,
      required BuildContext context,
      required VoidCallback press}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
    decoration: const BoxDecoration(
      color: Color(0xFFF7F7F7),
      borderRadius: BorderRadius.all(
        Radius.circular(defaultPadding * 1.25),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(
          tag: product.title!,
          child: Image.asset(product.image!),
        ),
        Text(
          product.title!,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        Text(
          "Fruits",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            price(context, "20.00"),
            favoriteButton(),
          ],
        )
      ],
    ),
  );
}