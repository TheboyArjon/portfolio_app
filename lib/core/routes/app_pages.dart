import 'package:get/get.dart';
import '../../screens/home/home_screen.dart';
import '../bindings/app_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: AppBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}
