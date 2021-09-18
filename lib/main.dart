import 'package:cinematech/application/bindings/application_bindings.dart';
import 'package:cinematech/application/ui/cinematech_app_ui_configs.dart';
import 'package:cinematech/modules/home/home_module.dart';
import 'package:cinematech/modules/login/login_module.dart';
import 'package:cinematech/modules/movie_detail/movie_detail_module.dart';
import 'package:cinematech/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: CinematechAppUiConfigs.title,
      initialBinding: ApplicationBindings(),
      theme: CinematechAppUiConfigs.theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
