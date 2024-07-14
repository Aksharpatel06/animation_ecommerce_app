import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

Container homeHeader(BuildContext context) {
  return Container(
    height: headerHeight,
    color: Colors.white,
    padding: const EdgeInsets.all(defaultPadding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              "Caesar Rincon",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black54),
            )
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage("assets/img/profile.png"),
        )
      ],
    ),
  );
}
