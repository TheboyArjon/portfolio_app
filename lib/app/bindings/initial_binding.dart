import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../controllers/home_controller.dart';

/// Registers every controller the app needs at startup.
/// Using `Get.put` (not lazy) here is fine because both controllers are
/// tiny and used immediately on the very first frame.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<HomeController>(HomeController());
  }
}
