import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkgpt/src/controllers/registration_screen_controller.dart';
import 'package:talkgpt/src/utils/widgets/my_button.dart';
import 'package:talkgpt/src/utils/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SingleChildScrollView(
              child: SafeArea(
                  child: Form(
                    key: controller.registrationformKey,
                child: Center(
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

                      const SizedBox(height: 25),

                      // password textfield
                      MyTextField(
                        controller: controller.passwordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),

                      const SizedBox(height: 25),
                      // sign Up button
                      MyButton(onTap: () {
                        controller.signUpWithEmailAndPassword();
                      }),
                    ],
                  ),
                ),
              )),
            ),
            bottomSheet: SafeArea(
              child: Container(
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
