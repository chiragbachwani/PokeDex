import 'package:flutter/material.dart';
import 'package:pokedex/const/text_style.dart';

Widget typecontainer(String? text, Color? color, double? size) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.40),
      borderRadius: BorderRadius.circular(12),
    ),
    child: normalText(text, color, size),
  );
}
