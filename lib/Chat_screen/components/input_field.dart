import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/constants.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class InputField extends StatefulWidget {
  const InputField({
    Key? key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var chat = context.read<ChatModel>();

    return Container(
      margin: EdgeInsets.all(15),
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
          color: bgColor.withOpacity(0.25),
          borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: _controller,
        onChanged: (value) {},
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  chat.addMessagesToChat(
                      ChatMessage(text: _controller.text, isSender: true));

                  _controller.clear();
                });
              },
              icon: Icon(
                Icons.send,
                size: 30,
                color: Colors.white,
              )),
          hintStyle: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              color: Colors.grey.shade300),
          hintText: "Type Here...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
