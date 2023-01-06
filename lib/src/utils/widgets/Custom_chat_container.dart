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
    return Container(
      clipBehavior: Clip.antiAlias,
      // height: SizeConfig(context).getProportionateScreenHeight(100),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(inputtext,style: TextStyle(color: Colors.white, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}