import 'package:flutter/material.dart';
import 'package:pokedex/const/text_style.dart';

Widget rowStyling(String? text, String? value) {
  return Row(
    children: [
      SizedBox(width: 200, child: headingText(text, Colors.grey, 16)),
      headingText(value, Colors.grey, 16),
    ],
  );
}
