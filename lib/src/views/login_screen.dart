import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkgpt/src/controllers/login_controller.dart';
import 'package:talkgpt/src/utils/widgets/my_button.dart';
import 'package:talkgpt/src/utils/widgets/my_textfield.dart';
import 'package:talkgpt/src/utils/widgets/square_tile.dart';
import 'package:talkgpt/src/views/phone_login/phone_number.dart';
import 'package:talkgpt/src/views/registration_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Form(
                  key: controller.loginformKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      // logo
                      const Icon(Icons.lock, size: 100),

                      const SizedBox(height: 50),

                      //welcome back!
                      Text(
                        'Welcome back',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(height: 50),
                      // username textfield
                      MyTextField(
                        controller: controller.emailController,
                        hintText: 'Username',
                        obscureText: false,
                      ),

                      const SizedBox(height: 25),

                      // password textfield
                      MyTextField(
                        controller: controller.passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 10),

                      //forgot password?
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.grey[600]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),

                      // sign in button
                      MyButton(
                        onTap: () {
                          controller.signInWithEmailAndPassword();
                        },
                      ),

                      const SizedBox(height: 50),

                      // or continue with
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'Or continue with',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      // google + facebook + twitter sign in buttons

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          //google button
                          InkWell(
                            onTap: () {
                              controller.googlesignin();
                            },
                            child:const SquareTile(
                                imagePath: 'https://imgs.search.brave.com/KGKy_xQhdXzQf2K32Xoqdw_INmQCQS1t-V_8dAD-yaM/rs:fit:728:724:1/g:ce/aHR0cHM6Ly9jZG4u/aW1nYmluLmNvbS8y/My83LzIvaW1nYmlu/LWdvb2dsZS1sb2dv/LWdvb2dsZS1zZWFy/Y2gtaWNvbi1nb29n/bGUtZ29vZ2xlLWxv/Z28taEVKTWpuZkNW/NE1BMWdEdGphV1R2/NWtjMS5qcGc'),
                          ),

                          const SizedBox(
                            width: 20,
                          ),

                          // facebook button

                          InkWell(
                            onTap: () {
                              
                            },
                            child: const SquareTile(
                                imagePath: 'https://imgs.search.brave.com/ikcrhKQN5Ni60H22fPzkPeFZsD0oUqDTRZdQputksE8/rs:fit:1200:1200:1/g:ce/aHR0cHM6Ly9wbmdp/bWcuY29tL3VwbG9h/ZHMvZ2l0aHViL2dp/dGh1Yl9QTkc0MC5w/bmc'),
                          ),

                          const SizedBox(
                            width: 20,
                          ),

                          //twitter button

                          InkWell(
                            onTap: () {
                              Get.to(() => phoneNumber());
                            },
                            child: const SquareTile(
                                imagePath: 'https://imgs.search.brave.com/sMX_L82woegzL_fd82xkYeWlj4GbcixB7L4hnc4D9HM/rs:fit:980:982:1/g:ce/aHR0cDovL2Nkbi5v/bmxpbmV3ZWJmb250/cy5jb20vc3ZnL2lt/Z180ODgxNjQucG5n'),
                          ),
                        ],
                      ),

                      const SizedBox(
                        height: 50,
                      ),

                      InkWell(
                        onTap: () {
                          Get.to(() => const RegisterPage());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a Member?',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              'Register now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
