// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkgpt/src/controllers/phone_number/auth_controller.dart';
import 'package:form_validator/form_validator.dart';
import 'package:talkgpt/src/utils/widgets/Custom_button.dart';
import 'package:talkgpt/src/utils/widgets/my_textfield.dart';
import 'package:talkgpt/src/views/otp_screen.dart';

class phoneNumber extends StatefulWidget {
  const phoneNumber({Key? key}) : super(key: key);

  @override
  State<phoneNumber> createState() => _phoneNumberState();
}

class _phoneNumberState extends State<phoneNumber> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  final AuthController authController = Get.find();
  final _phone = TextEditingController();
  final _countryCode = "IN";
  final _countryPhoneCode = "+91";
  final validatorNumber =
      ValidationBuilder(requiredMessage: "Please enter your phone number.")
          .phone()
          .build();
  String pin = "";

  void fn(String pin) {
    pin = this.pin;
    print(pin);
  }

  Future<bool?> _validate() async {
    return _loginForm.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        init: authController,
        builder: (_) {
          return Form(
            key: _loginForm,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Column(
                    children: [
                      // const buildCard(),
                      MyTextField(
                        hintText: "Enter Your Phone Number",
                        obscureText: false,
                        controller: _phone,
                      ),
                      Custombutton(
                        inputcolor: Colors.black,
                        customheight: 55,
                        customwidth: 330,
                        inputrad: 15,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                        text: "Send OTP",
                        press: () async {
                          await _validate().then(
                            (value) {
                              if (value == true) {
                                String number =
                                    "$_countryPhoneCode ${_phone.text}";
                                print(number);
                                authController.login(number);
                                //authController.login(_phone.text);
                                print("yyyyyyyyyyy");
                                Get.to(() => OTPScreen(
                                      number: number,
                                    ));
                              }
                            },
                          );
                          //Get.to(() => OTPScreen(fn: fn,));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
