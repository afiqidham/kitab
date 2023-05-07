import 'package:get/get.dart';
import 'package:pos/binding/home_binding.dart';
import 'package:pos/ui/screens/login_screen.dart';
import 'package:pos/ui/splash/splash_screen.dart';
import 'package:get/route_manager.dart';
import 'package:pos/utils/route.dart';

import '../ui/screens/main_screen.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: RouteUtil.home, 
      page: () => const MainScreen(),
      binding: HomeBinding()
      ),
    GetPage(
      name: RouteUtil.login, 
      page: () =>  LoginScreen(),
      ),
    GetPage(name: RouteUtil.splash, page: () =>  const SplashScreen()),
  ];
}
