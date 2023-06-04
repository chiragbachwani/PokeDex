import 'package:flutter/material.dart';
import 'package:pokedex/const/text_style.dart';

Widget statRow(String? text, String? value) {
  var rowWidth = int.parse(value.toString());
  return Row(
    children: [
      SizedBox(
          width: 150,
          child: headingText(text, const Color.fromARGB(255, 92, 90, 90), 16)),
      SizedBox(width: 100, child: headingText(value, Colors.black, 16)),
      Container(
        height: 3,
        width: rowWidth.toDouble(),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
      )
    ],
  );
}
