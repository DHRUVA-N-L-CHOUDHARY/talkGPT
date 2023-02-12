import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkgpt/firebase_options.dart';
import 'package:talkgpt/src/routes/app_pages.dart';
import 'package:talkgpt/src/views/chat_screen.dart';
import 'package:talkgpt/src/views/login_screen.dart';

import 'src/controllers/phone_number/auth_controller.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  final _authController = Get.put(AuthController());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    )
  );
}

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        print(snapshot.data.toString());
        print("dkslfsjdkjfjkdf");
        return snapshot.data != null ? ChatScreen() : LoginPage();
      },
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
  
//         primarySwatch: Colors.orange,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

