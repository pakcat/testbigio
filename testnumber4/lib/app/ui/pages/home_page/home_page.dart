import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../controllers/home_controller.dart';
import '../../../routes/routes.dart';
import '../../theme/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../utils/responsive_util.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  List<String> button = [
    "Films",
    "People",
    "Planets",
    "Species",
    "Starships",
    "Vehicles"
  ];
  List<String> posterfilm = [
    "assets/film1.jpg",
    "assets/film2.jpg",
    "assets/film3.jpg",
    "assets/film4.jpg",
    "assets/film5.jpg",
    "assets/film6.jpg"
  ];

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = ResponsiveUtil(context).byHeight;
    var w = ResponsiveUtil(context).byWidth;
    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: w * 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 50,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.changeindex(0);
                    },
                    child: Text(
                      "All Movies",
                      style: TextStyle(
                          // ignore: unrelated_type_equality_checks
                          color: (controller.index == 0)
                              ? onprimary
                              : Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeindex(2);
                    },
                    child: Text(
                      "Categories",
                      style: TextStyle(
                          // ignore: unrelated_type_equality_checks
                          color: (controller.index == 2)
                              ? onprimary
                              : Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.changeindex(3);
                    },
                    child: Text(
                      "My Account",
                      style: TextStyle(
                          // ignore: unrelated_type_equality_checks
                          color: (controller.index == 3)
                              ? onprimary
                              : Colors.white),
                    ),
                  )
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            const Text(
              "Welcome to",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              height: h * 250,
              width: w * 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black,
                  image: const DecorationImage(
                      image: AssetImage("assets/starwars.png"),
                      fit: BoxFit.contain)),
            )),
            SizedBox(
              height: h * 20,
            ),
            SizedBox(
              height: h * 20,
            ),
            const Text(
              "Film",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            SizedBox(
              height: h * 20,
            ),
            GetBuilder<HomeController>(
              initState: (_) async {
                controller.getfilm();
              },
              builder: (_) {
                if (_.film.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          enableInfiniteScroll: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.4,
                          initialPage: 2,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                        ),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.film, arguments: [
                                _.film[itemIndex].url,
                                posterfilm[itemIndex]
                              ]);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(posterfilm[itemIndex]),
                                      fit: BoxFit.fitWidth)),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container Button(String text, bool status) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
          color: HexColor("#D98639"), borderRadius: BorderRadius.circular(4)),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
