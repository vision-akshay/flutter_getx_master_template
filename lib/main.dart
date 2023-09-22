import 'package:cricket_app/bindings/home_screen_binding.dart';
import 'package:cricket_app/utils/app_routes.dart';
import 'package:cricket_app/views/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      initialBinding: HomeScreenBinding(),
      getPages: AppRoutes.routes,
    );
  }
}
