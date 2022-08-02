import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testnumber4/app/bindings/home_binding.dart';
import 'package:testnumber4/app/ui/pages/root.dart';
import 'package:testnumber4/app/ui/theme/appthemedata.dart';

import 'app/routes/pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: HomeBinding(),
    getPages: AppPages.pages,
    home: RootPage(),
  ));
}
