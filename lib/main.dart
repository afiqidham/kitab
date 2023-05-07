import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/binding/home_binding.dart';
import 'package:pos/routes/app_route.dart';
import 'package:pos/utils/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Point Of Sale Kitab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      initialRoute: RouteUtil.login,
      getPages: AppRoute.routes,
    );
  }
}
