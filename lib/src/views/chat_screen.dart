import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:talkgpt/src/controllers/speech_controller.dart';
import 'package:talkgpt/src/utils/widgets/Custom_button.dart';
import 'package:talkgpt/src/utils/widgets/Custom_chat_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpeechController>(
        init: SpeechController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: Center(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: ChatContainer(inputtext: controller.speechText.value,),
                  ),
                  Obx(
                    () => Text(
                      controller.speechText.value,
                      style: TextStyle(fontSize: 18, ),
                    ),
                  )
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
            floatingActionButton: Obx(
              () => AvatarGlow(
                
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    controller.isListening.value?Icons.mic:Icons.mic_none,
                  ),
                  onPressed: () {
                    controller.listen();
                    
                  },
                ),
                animate: controller.isListening.value,
                endRadius: 90,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                repeatPauseDuration: Duration(milliseconds: 2000),
              )
            ),
            bottomSheet: Container(
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Custombutton(
                  text: "Submit",
                  inputcolor: Colors.black,
                  customheight: 55,
                  customwidth: 330,
                  inputrad: 15,
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  press: () {
                    
                   controller.speechText.value = ''; 

                  },
                ),
              ],
            ),
          ),
        )
          );
        });
  }
}
