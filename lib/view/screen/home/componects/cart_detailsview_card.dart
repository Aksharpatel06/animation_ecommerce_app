import 'package:animation_ecommerce_app/view/modal/productitem_modal.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../componects/price.dart';

ListTile cartDetailsViewCard(
    {required BuildContext context, required ProductitemModal productItem}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
    leading: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(productItem.productModal!.image!),
    ),
    title: Text(
      productItem.productModal!.title!,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    ),
    trailing: FittedBox(
      child: Row(
        children: [
          price(context, "20"),
          Text(
            "  x ${productItem.quantity}",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
