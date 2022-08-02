import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../controllers/film_controller.dart';
import '../../theme/color.dart';
import '../../utils/responsive_util.dart';

class FilmPage extends GetView<FilmController> {
  const FilmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = ResponsiveUtil(context).byHeight;
    var data = Get.arguments;
    return Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  data[1],
                  height: h * 400,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              GetBuilder<FilmController>(
                initState: (_) async {
                  controller.getfilm(data[0]);
                },
                builder: (_) {
                  if (_.film.isNotEmpty &&
                      _.characters.isNotEmpty &&
                      _.planets.isNotEmpty &&
                      _.starships.isNotEmpty &&
                      _.vehicles.isNotEmpty &&
                      _.species.isNotEmpty) {
                    _.chara = _.characters.join(", ");
                    _.planet = _.planets.join(", ");
                    _.starship = _.starships.join(", ");
                    _.vehicle = _.vehicles.join(", ");
                    _.spesis = _.species.join(", ");

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: h * 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: h * 30,
                          ),
                          Text(
                            "${_.film[0].title} (${DateFormat('yyyy').format(_.film[0].releaseDate!)})",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 20,
                          ),
                          ExpandableText(
                            _.film[0].openingCrawl,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            expandText: 'More',
                            collapseText: 'show less',
                            maxLines: 3,
                            linkColor: HexColor("#D98639"),
                          ),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Director",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(
                            _.film[0].director,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Producers",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(
                            _.film[0].producer,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Characters",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(_.chara!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Planets",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(_.planet,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Starships",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(_.starship,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Vehicles",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(_.vehicle,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: h * 20,
                          ),
                          const Text(
                            "Spesies",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: h * 10,
                          ),
                          Text(_.spesis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15)),
                          SizedBox(
                            height: h * 30,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                        child: Column(
                      children: [
                        SizedBox(
                          height: h * 50,
                        ),
                        const CircularProgressIndicator()
                      ],
                    ));
                  }
                },
              )
            ],
          ),
        ));
  }
}
