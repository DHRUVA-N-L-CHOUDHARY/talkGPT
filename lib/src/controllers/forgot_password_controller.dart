import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController
{
  final forgotPasswordInput = GlobalKey<FormState>();
  TextEditingController forgot = TextEditingController();

resetPassword(String email) async{
  final auth= FirebaseAuth.instance;
  try{
     await auth.sendPasswordResetEmail(email: email);
     Get.snackbar('Hi', 'CHECK email.');
     Get.offAllNamed("/login");
  }on FirebaseAuthException catch (e){
    if (e.code == 'user-not-found') {
      Get.snackbar('Hi', 'No user found for that email.');
    }
  }catch(e){
    print(e);
  }
}
}