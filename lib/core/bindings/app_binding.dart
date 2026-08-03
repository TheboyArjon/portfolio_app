import 'package:get/get.dart';
import '../controllers/theme_controller.dart';
import '../controllers/portfolio_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<PortfolioController>(PortfolioController(), permanent: true);
  }
}
