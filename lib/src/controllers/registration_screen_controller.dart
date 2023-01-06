
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkgpt/src/services/auth.dart';
import 'package:talkgpt/src/utils/widgets/custom_loading.dart';
import 'package:talkgpt/src/views/login_screen.dart';



class RegistrationController extends GetxController {
  final registrationformKey = GlobalKey<FormState>();
  AuthService authService = AuthService();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  bool isSecure = true;
  bool move = false;

  @override
  void onInit() {
    super.onInit();
    // PreferenceUtils.init();
  }

  setSecureUnSecure() {
    isSecure = !isSecure;
    update();
  }

  signUpWithEmailAndPassword() async {
    if (registrationformKey.currentState!.validate()) {
      Get.focusScope?.unfocus();
      showLoader(Get.context);
      await authService
          .signUpWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((result) async {
        Get.back();
        if (result != null) {
          if (kDebugMode) {
            print("result : $result");
          }
          Get.offAll(LoginPage());
        }
      });
    }
  }
}
