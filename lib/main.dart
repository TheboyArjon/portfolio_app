import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/app_theme.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Arjon's Portfolio",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
