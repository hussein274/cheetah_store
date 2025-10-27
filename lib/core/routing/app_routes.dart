import 'package:flutter/material.dart';

import '../../features/auth/ui/view/login_view.dart';
import '../../features/auth/ui/view/register_view.dart';
import '../../features/splash/ui/view.dart';
import '../../features/tabs/home/ui/view/get_products_by_category.dart';
import '../../features/tabs/home/ui/view/home_view.dart';

abstract class AppRoutes {
  static Route SplashRoute() {
    return MaterialPageRoute(
      builder: (context) => const SplashView(),
    );
  }
  static Route LoginRoute() {
    return MaterialPageRoute(
      builder: (context) => LoginView(),
    );
  }
  static Route RegisterRoute() {
    return MaterialPageRoute(
      builder: (context) => RegisterView(),
    );
  }
  static Route HomeRoute() {
    return MaterialPageRoute(
      builder: (context) => HomeView(),
    );

  }
  static Route GetProductsByCategoryRoute(String id) {
    return MaterialPageRoute(
      builder: (context) => GetProductsByCategory(id:id ,),
    );
  }
}