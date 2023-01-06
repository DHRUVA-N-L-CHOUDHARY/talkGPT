// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController
{
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();
  var isListening = false.obs;
  var speechText = 'Press the Mic Button and Start Speaking'.obs;
 late SpeechToText speechToText;
@override
void onInit()
{
  super.onInit();
  speechToText  = SpeechToText();
}
@override
void onReady()
{
  super.onReady();
  
}

void listen() async
{
  if(!isListening.value)
  {
    bool available = await speechToText.initialize(
      onStatus: (val){},
      onError:  (val){},
    );
    if(available)
    {
      isListening.value =  true;
      speechToText.listen(onResult: (val){
        speechText.value = val.recognizedWords;
      });
      print(speechText.toString());
    }
  }
  else
  {
    isListening.value =  false;
    speechToText.stop();
    // speechText.value = '';
  }
}


speak(String text) async  
{
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}
}