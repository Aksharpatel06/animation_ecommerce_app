import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

CircleAvatar favoriteButton({double? radius}) {
  return CircleAvatar(
    radius: radius ?? 12.00,
    backgroundColor: const Color(0xFFE3E2E3),
    child: SvgPicture.asset("assets/icon/heart.svg"),
  );
}
