import 'package:flutter/material.dart';
import 'package:pokedex/api_services.dart';
import 'package:pokedex/const/poke_type_container.dart';
import 'package:pokedex/const/text_style.dart';
import 'package:pokedex/detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PokeDex(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class PokeDex extends StatelessWidget {
  const PokeDex({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Image.asset(
          "assets/pokelogo.png",
          width: 100,
          fit: BoxFit.fitWidth,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final RenderBox button =
                    context.findRenderObject() as RenderBox;
                final RenderBox overlay =
                    Overlay.of(context).context.findRenderObject() as RenderBox;
                final Offset topLeftPosition =
                    button.localToGlobal(Offset.zero, ancestor: overlay);

                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    overlay.size.width, // left
                    -topLeftPosition.dy, // top
                    0, // right
                    0, // bottom
                  ),
                  items: [
                    const PopupMenuItem(
                      child: Text('Developed by Chirag'),
                    ),
                  ],
                  elevation: 8.0,
                );
              },
              icon: Image.asset("assets/pokeball.png")),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(
                "assets/pokedex.png",
                width: 120,
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: FutureBuilder(
                  future: getAPI(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      var data = snapshot.data;
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: width < 600
                                ? 2
                                : width < 1100
                                    ? 4
                                    : 6,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                            data: data[index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 130,
                                    left: 130,
                                    top: 0,
                                    child: Opacity(
                                      opacity: 0.7,
                                      child: Image.asset(
                                        "assets/pokeball.png",
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 60,
                                    top: 50,
                                    child: Image.network(
                                      data[index]["imageurl"],
                                      width: 150,
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        headingText(data[index]["name"],
                                            Colors.white, 22),
                                        data[index]["typeofpokemon"].length <= 1
                                            ? typecontainer(
                                                data[index]["typeofpokemon"][0]
                                                    .toString(),
                                                Colors.white,
                                                16)
                                            : Column(
                                                children: [
                                                  typecontainer(
                                                      data[index][
                                                              "typeofpokemon"][0]
                                                          .toString(),
                                                      Colors.white,
                                                      16),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  typecontainer(
                                                      data[index]
                                                          ["typeofpokemon"][1],
                                                      Colors.white,
                                                      16),
                                                ],
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.lightGreen),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
