import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../controller/home_controller.dart';
import 'cart_detailsview_card.dart';

SingleChildScrollView cartDetailsView(BuildContext context, HomeController controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text("Cart",
            style: Theme.of(context)
                .textTheme
                .titleLarge),
        ...List.generate(
            controller.cart.length,
                (index) => cartDetailsViewCard(
                context: context,
                productItem:
                controller.cart[index])),
        const SizedBox(height: defaultPadding),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Next - \$30"),
          ),
        )
      ],
    ),
  );
}
