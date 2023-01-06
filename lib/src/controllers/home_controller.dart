import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:talkgpt/src/routes/app_pages.dart';

class HomeController extends GetxController {
  late GoogleSignIn googleSign;
  late GitHubSignIn gitHubSignIn;
  var isSignIn = false.obs;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  void onInit() {
    super.onInit();
    // PreferenceUtils.init();
    firebaseUser = Rx<User?>(firebaseAuth.currentUser);
    firebaseUser.bindStream(firebaseAuth.authStateChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed("/login");
    } else {
      Get.offAllNamed("/nav");
    }
  }

  @override
  void onReady() async {
    googleSign = GoogleSignIn();
    // gitHubSignIn = GitHubSignIn(clientId: clientId, clientSecret: clientSecret, redirectUrl: redirectUrl)
    ever(isSignIn, handleAuthStateChanged);
    isSignIn.value = await firebaseAuth.currentUser != null;
    firebaseAuth.authStateChanges().listen((event) {
      isSignIn.value = event != null;
    });

    super.onReady();
  }

  @override
  void onClose() {}

  void handleAuthStateChanged(isLoggedIn) {
    if (isLoggedIn) {
      Get.offAllNamed(Routes.CHAT, arguments: firebaseAuth.currentUser);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
