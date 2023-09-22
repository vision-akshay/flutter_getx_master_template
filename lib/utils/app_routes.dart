
import '../bindings/home_screen_binding.dart';
import '../views/home_screen/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  AppRoutes._();


  static const homeScreen = "/homeScreen";


  static final routes = [
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeScreenBinding(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
   
  ];
}
