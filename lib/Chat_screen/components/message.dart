import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/Chat_screen/components/text_message.dart';
import 'package:chatbot/constants.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final ChatMessage message;
  const Message({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!message.isSender) ...{
          Container(
              margin: EdgeInsets.only(top: defaultPadding / 2),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  "images/sad_tooth.jpg",
                ),
              ))
        },
        SizedBox(
          width: defaultPadding / 2,
        ),
        Container(
            margin: const EdgeInsets.only(top: defaultPadding / 2),
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
            decoration: BoxDecoration(
                color: message.isSender ? primaryColor : secondColor,
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              message.text,
            )),
      ],
    );
  }
}
