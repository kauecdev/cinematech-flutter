import 'package:cinematech/application/modules/module.dart';
import 'package:cinematech/modules/home/home_bindings.dart';
import 'package:cinematech/modules/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(name: '/home', page: () => HomePage(), binding: HomeBindings()),
  ];
}
