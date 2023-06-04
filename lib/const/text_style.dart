import "package:flutter/material.dart";

Widget headingText(

  String? text,Color? color,  double? size
) {
  return Text(text!,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: color,
      ));
}

Widget normalText(

  String? text,Color? color,  double? size
) {
  return Text(text!,
      style: TextStyle(
        fontSize: size,
        color: color,
      ));
}

