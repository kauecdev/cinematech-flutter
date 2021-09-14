import 'package:cinematech/application/modules/module.dart';
import 'package:cinematech/modules/splash/splash_bindings.dart';
import 'package:cinematech/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(name: '/', page: () => SplashPage(), binding: SplashBindings()),
  ];
}
