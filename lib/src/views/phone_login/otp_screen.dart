import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:talkgpt/src/controllers/phone_number/auth_controller.dart';
import 'package:talkgpt/src/utils/widgets/Custom_button.dart';
import 'package:talkgpt/src/views/phone_login/otp_page.dart';

class OTPScreen extends StatefulWidget {
  final String? number;
  const OTPScreen({Key? key, this.number});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String currentString = "";
  final AuthController authController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder(
            init: authController,
            builder: (AuthController _) {
              return _.isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OtpHeader(
                          phoneNumber: widget.number ?? "",
                        ),
                        const SizedBox(height: 44),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Pinput(
                            length: 6,
                            onChanged: (String pin) {
                              currentString = pin;
                            },
                          ),
                        ),
                        Text(
                          'Didn’t receive code?',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: const Color.fromRGBO(62, 116, 165, 1),
                          ),
                        ),
                        Text(
                          'Resend',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: const Color.fromRGBO(62, 116, 165, 1),
                          ),
                        ),
                        const SizedBox(
                          height: 80,
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
                          text: "Verify",
                          margins: 10.0,
                          press: () {
                            setState(() {
                              authController.otpVerify(currentString);
                            });
                          },
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
