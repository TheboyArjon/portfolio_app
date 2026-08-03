import 'package:get/get.dart';
import '../bindings/initial_binding.dart';
import '../views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: InitialBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
