import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

Text price(BuildContext context,String amount) {
  return Text.rich(
    TextSpan(
      text: "\$",
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
      children: [
        TextSpan(
          text: amount,
          style: const TextStyle(color: Colors.black),
        ),
        const TextSpan(
          text: "/kg",
          style:
          TextStyle(color: Colors.black26, fontWeight: FontWeight.normal),
        )
      ],
    ),
  );
}
