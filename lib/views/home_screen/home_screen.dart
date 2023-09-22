import 'package:cricket_app/shared_widgets/app_bar_widget.dart';

import '../../controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const  AppBarWidget(
        titleText: 'Getx Example App',
        showBackButton: false,
      ),
      body: Center(
        child: Text(controller.stringLabel.value),
      ),
    );
  }
}
