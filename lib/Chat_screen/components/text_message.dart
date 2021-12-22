import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/constants.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: defaultPadding / 2),
        padding: EdgeInsets.symmetric(
            horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
        decoration: BoxDecoration(
            color: message.isSender ? primaryColor : bgColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          message.text,
        ));
  }
}
