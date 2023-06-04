import 'package:flutter/material.dart';
import 'package:pokedex/const/landscape_container.dart';
import 'package:pokedex/const/portrait_container.dart';
import 'package:pokedex/const/row_styling.dart';
import 'package:pokedex/const/stat_row.dart';
import 'package:pokedex/const/text_style.dart';

class DetailScreen extends StatelessWidget {
  final dynamic data;
  const DetailScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var orientation = MediaQuery.of(context).orientation;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.infinity,
                color: Colors.red,
                child: orientation == Orientation.portrait
                    ? portraitContainer(data)
                    : landscapeContainer(data),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(12))),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Color.fromARGB(255, 76, 76, 76),
                        tabs: [
                          Tab(
                            text: "About",
                          ),
                          Tab(
                            text: "Base Stats",
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(children: [
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              normalText(
                                  data["xdescription"], Colors.black, 16),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: width - 100,
                                  child: Card(
                                    color: const Color.fromARGB(
                                        255, 241, 241, 241),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              headingText(
                                                  "Height",
                                                  const Color.fromARGB(
                                                      255, 91, 89, 89),
                                                  16),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              headingText(
                                                  data["height"],
                                                  const Color.fromARGB(
                                                      255, 79, 76, 76),
                                                  16),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              headingText(
                                                  "Weight",
                                                  const Color.fromARGB(
                                                      255, 91, 89, 89),
                                                  16),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              headingText(
                                                  data["weight"],
                                                  const Color.fromARGB(
                                                      255, 91, 89, 89),
                                                  16),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 15),
                              headingText("Breeding", Colors.black, 16),
                              const SizedBox(
                                height: 10,
                              ),
                              rowStyling(
                                  "Male Percentage", data["male_percentage"]),
                              rowStyling("Female Percentage",
                                  data["female_percentage"]),
                              rowStyling("Egg groups", data["egg_groups"]),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(children: [
                              const SizedBox(
                                height: 15,
                              ),
                              statRow("HP", data["hp"].toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              statRow("Attack", data["attack"].toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              statRow("Defense", data["defense"].toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              statRow("Special Attack",
                                  data["special_attack"].toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              statRow("Special Defense",
                                  data["special_defense"].toString()),
                              const SizedBox(
                                height: 5,
                              ),
                              statRow("Speed", data["speed"].toString()),
                            ]),
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
