// ignore_for_file: unnecessary_overrides


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talkgpt/src/controllers/home_controller.dart';
import 'package:talkgpt/src/services/auth.dart';
import 'package:talkgpt/src/utils/widgets/google_sign_in_load.dart';
import 'package:talkgpt/src/views/login_screen.dart';
import 'package:talkgpt/src/views/registration_screen.dart';

import '../utils/widgets/custom_loading.dart';

class LoginController extends GetxController {
   HomeController homeController = Get.put(HomeController());
  final loginformKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  String? tokenId;
  bool isLoading = false;
  late Rx<User?> firebaseUser;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isAuthenticated = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSecure = true;
  @override
  void onInit() {
    super.onInit();
  }

  setSecureUnSecure() {
    isSecure = !isSecure;
    update();
  }

  Future<void> signInWithEmailAndPassword() async {
    Get.focusScope?.unfocus();
    if (loginformKey.currentState!.validate()) {
      showLoader(Get.context);
      await authService
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text)
          .then((result) async {
        tokenId = await firebaseAuth.currentUser?.getIdToken(true);
        Get.back();
        if (result != null) {
          if (kDebugMode) {
            print(result.toString());
            print(result.toString());
          }
          Get.offAll(() => RegisterPage());
        }
      });
    }
  }

  void googlesignin() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount =
        await homeController.googleSign.signIn();
    if (googleSignInAccount == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await homeController.firebaseAuth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
    }
  }
}
