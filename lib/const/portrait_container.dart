import 'package:flutter/material.dart';
import 'package:pokedex/const/poke_type_container.dart';
import 'package:pokedex/const/text_style.dart';

Widget portraitContainer(data) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      headingText(data["name"], Colors.white, 36),
      Row(
        children: [
          data["typeofpokemon"].length <= 1
              ? typecontainer(data["typeofpokemon"][0], Colors.white, 16)
              : Row(
                  children: [
                    typecontainer(data["typeofpokemon"][0], Colors.white, 16),
                    typecontainer(data["typeofpokemon"][1], Colors.white, 16),
                  ],
                ),
        ],
      ),
       const SizedBox(
        height: 50,
      ),
      Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              "assets/pokeball2.png",
              width: 200,
              color: Colors.white.withOpacity(0.5),
            ),
            Image.network(
              data["imageurl"],
              width: 200,
            ),
          ],
        ),
      )
    ],
  );
}
