// import 'dart:html';
// ignore_for_file: sort_child_properties_last
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:talkgpt/src/controllers/speech_controller.dart';
import 'package:talkgpt/src/utils/widgets/Custom_chat_container.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Response response;
  Dio dio = Dio();
  final ScrollController scrollController = ScrollController();

  bool error = false;
  bool loading = false;
  String errmsg = "";
  var apidata;
  String ans = "";
  List<ChatContainer> list = [
    const ChatContainer(
      inputtext: "Press the mic to give input",
    ),
  ];

  @override
  void initState() {
    // getsearch(); 
    super.initState();
  }

  getsearch(String s) async {
    String url = "https://talk-gpt-server.onrender.com";
    response = await dio.post(url, data: {'prompt': s});
    // print(response);

    if (response.statusCode == 200) {
      //fetch successful
      if (response.data["bot"] == "") {
        error = true;
        return "Couldnt fetch data";
      } else {
        setState(() {
          print(response.data["bot"].toString().trim());
          list.add(
              ChatContainer(inputtext: response.data["bot"].toString().trim()));
        });
        return response.data["bot"];
      }
    } else {
      error = true;
      errmsg = "Error while fetching data.";
      return errmsg;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SpeechController>(
        init: SpeechController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: Center(
              child: SingleChildScrollView(
                child:
                    // Padding(
                    //   padding: EdgeInsets.all(15.0),
                    //   child: ChatContainer(
                    //     inputtext: controller.speechText.value,
                    //   ),
                    // ),
                    Obx(
                  () => controller.isListening.value
                      ? Container(
                          child: Text(controller.speechText.value),
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                              right: 0.0, left: 0.0, bottom: 8.0, top: 8.0),
                          width: MediaQuery.of(context).size.width - 10,
                          height: MediaQuery.of(context).size.height - 100,
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: list.length,
                            itemBuilder: ((context, index) {
                              return list[index];
                            }),
                          ),
                        ),
                ),
                // Padding(
                //   padding: EdgeInsets.all(15.0),
                //   child: ChatContainer(
                //     inputtext: ans,
                //   ),
                // ),
                // Obx(
                //   () => Text(
                //     controller.speechText.value,
                //     style: TextStyle(
                //       fontSize: 18,
                //     ),
                //   ),
                // ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Obx(
              () => AvatarGlow(
                child:  FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    controller.isListening.value ? Icons.mic : Icons.mic_none,
                  ),
                  onPressed: () {
                    controller.listen();
                    setState(() {
                      getsearch(controller.speechText.value);
                      // list.add(ChatContainer(inputtext: controller.speechText.value));
                      controller.speechText.value = '';
                    });
                  },
                ),
                animate: controller.isListening.value,
                endRadius: 90,
                duration: Duration(milliseconds: 2000),
                repeat: true,
                repeatPauseDuration: Duration(milliseconds: 2000),
              ),
            ),
            // bottomSheet: Container(
            //   color: Colors.grey.shade300,
            //   child: Padding(
            //     padding: const EdgeInsets.all(10.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Custombutton(
            //           text: "Submit",
            //           inputcolor: Colors.black,
            //           customheight: 55,
            //           customwidth: 330,
            //           inputrad: 15,
            //           textStyle: const TextStyle(
            //             fontSize: 22,
            //             color: Colors.white,
            //           ),
            //           press: () {
            //             // print(ans);
            //             list.add(ChatContainer(inputtext: controller.speechText.value));
            //             setState(() {
            //               getsearch(controller.speechText.value);
            //               // list.add(ChatContainer(inputtext: controller.speechText.value));
            //             controller.speechText.value = '';
            //             });
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // )
          );
        });
  }

  // Widget buildListMessage() {
  //   return Container(
  //     padding:
  //         const EdgeInsets.only(right: 0.0, left: 0.0, bottom: 8.0, top: 8.0),
  //     width: MediaQuery.of(context).size.width - 10,
  //     child: ListView.builder(
  //       controller: scrollController,
  //       itemCount: list.length,
  //       reverse: true,
  //       itemBuilder: ((context, index) {
  //         return list[index];
  //       }),
  //     ),
  //   );
  // }
}
