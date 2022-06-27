import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/Services/firebase_client.dart';
import 'package:chatbot/Services/firebase_client.dart';
import 'package:chatbot/constants.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:firebase_core/firebase_core.dart';
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
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    var chat = context.read<ChatModel>();
    var client = FirebaseClients();
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
        onChanged: (value) {
          if (_controller.text.isNotEmpty) {
            setState(() {
              isEmpty = false;
            });
          }
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (!isEmpty) {
                    chat.addMessagesToChat(
                        ChatMessage(text: _controller.text, isSender: true));
                    //client.setConversation(chat.getAllMessages, chat.userMail);
                    _controller.clear();
                  }
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
          hintText: "Buraya yazınız...",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
