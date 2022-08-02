import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnumber4/app/ui/theme/color.dart';
import '../../../controllers/search_controller.dart';
import '../../utils/responsive_util.dart';

// ignore: must_be_immutable
class SearchPage extends GetView<SearchController> {
  @override
  SearchController controller = Get.put(SearchController());
  TextEditingController txt = TextEditingController();

  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var h = ResponsiveUtil(context).byHeight;
    return Scaffold(
      backgroundColor: background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: TextField(
                controller: txt,
                onChanged: (value) {
                  controller.searchplanet(value);
                },
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: onprimary,
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
          ),
          GetBuilder<SearchController>(
            builder: (_) {
              if (_.resultplanet != null && _.resultpeople != null) {
                return Expanded(
                    child: SingleChildScrollView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Planets",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: h * 110,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemCount: _.resultplanet!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(h * 12),
                              margin: EdgeInsets.only(left: h * 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 12),
                                  color: onprimary),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name : ${_.resultplanet![index].name}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Population : ${_.resultplanet![index].population}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Diameter : ${_.resultplanet![index].diameter}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Terrain : ${_.resultplanet![index].terrain} ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "People",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: h * 110,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const ScrollPhysics(),
                          itemCount: _.resultpeople!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.all(h * 12),
                              margin: EdgeInsets.only(left: h * 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(h * 12),
                                  color: onprimary),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name : ${_.resultpeople![index].name}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Birth year : ${_.resultpeople![index].birthYear}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Height : ${_.resultpeople![index].height}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                  Text(
                                    "Mass : ${_.resultpeople![index].mass} ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: h * 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
              } else if (txt.text == "") {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    const Text(
                      "Search Something",
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 100,
                    ),
                    CircularProgressIndicator(),
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}
