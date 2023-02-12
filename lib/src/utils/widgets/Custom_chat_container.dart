import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:talkgpt/src/config/Constants/size_config.dart';

class ChatContainer extends StatelessWidget {
  final String inputtext;
  const ChatContainer({super.key, required this.inputtext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:8.0, right: 8.0, left:8.0),
      child: Container(
        // clipBehavior: Clip.antiAlias,
        // height: SizeConfig(context).getProportionateScreenHeight(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right:20.0, left: 20.0, bottom: 20.0, top: 10.0),
          child: Text(inputtext.trim(),style: const TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}