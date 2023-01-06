import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LogoutController extends GetxController {
  Future<void> logoutUser() async {
    GetStorage().remove('authToken');
    GetStorage().remove('tokenId');
    await FirebaseAuth.instance.signOut();
  }
}