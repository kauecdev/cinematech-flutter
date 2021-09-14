import 'package:cinematech/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            'assets/images/background_login.png',
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black45,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png'),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: Get.width * 0.9,
                  height: 42,
                  child: SignInButton(Buttons.Google,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () => controller.login(),
                      text: 'Entrar com o Google'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
