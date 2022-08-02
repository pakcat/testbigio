import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:testnumber4/app/ui/theme/color.dart';
import '../../../controllers/settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child:
                    Lottie.asset('assets/astronot.json', fit: BoxFit.contain)),
            const Text(
              "Coming Soon",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
