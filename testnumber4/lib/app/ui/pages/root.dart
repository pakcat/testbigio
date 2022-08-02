// ignore_for_file: unnecessary_const

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testnumber4/app/controllers/root_controller.dart';
import 'package:testnumber4/app/ui/pages/home_page/home_page.dart';
import 'package:testnumber4/app/ui/pages/search_page/search_page.dart';
import 'package:testnumber4/app/ui/pages/settings_page/settings_page.dart';
import 'package:testnumber4/app/ui/theme/color.dart';

class RootPage extends StatelessWidget {
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> pagesList = [
    HomePage(),
    SearchPage(),
    const SettingsPage(),
  ];

  RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RootController controller = Get.put(RootController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: pagesList,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: onprimary,
        backgroundColor: background,
        buttonBackgroundColor: Colors.transparent,
        key: _bottomNavigationKey,
        items: const <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.home_rounded,
              size: 17,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.search,
              size: 17,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.settings,
              size: 17,
              color: Colors.white,
            ),
          ),
        ],
        onTap: (index) {
          controller.tappedIndex(index);
        },
      ),
    );
  }

  //list Bottom Navigation
  // ignore: non_constant_identifier_names
  List<BottomNavigationBarItem> get NavList {
    return [
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home_rounded,
          size: 32,
        ),
        label: 'Beranda',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/monitoring.png"),
          size: 32,
        ),
        label: 'Monitoring',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/chat.png"),
          size: 32,
        ),
        label: 'Chat',
      ),
      const BottomNavigationBarItem(
        icon: ImageIcon(
          AssetImage("assets/icon/botnav/person.png"),
          size: 32,
        ),
        label: 'Profil',
      ),
    ];
  }
}
