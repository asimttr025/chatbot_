import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/Chat_screen/components/input_field.dart';
import 'package:chatbot/Chat_screen/components/message.dart';
import 'package:chatbot/constants.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:chatbot/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: Colors.grey.shade300,
      body: Container(child: Center(child: getMyCardView(context))),
    );
  }
}

class CardView extends StatefulWidget {
  final double horizontal;
  final double vertical;
  const CardView({
    Key? key,
    required this.horizontal,
    required this.vertical,
  }) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState(horizontal, vertical);
}

class _CardViewState extends State<CardView> {
  double horizontal;
  double vertical;
  _CardViewState(this.horizontal, this.vertical);

  @override
  Widget build(BuildContext context) {
    var chat = context.watch<ChatModel>();
    return Card(
      color: Colors.green.shade300,
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: ListView.builder(
                    itemCount: chat.getAllMessages.length,
                    itemBuilder: (context, index) {
                      return Message(
                        message: chat.getAllMessages[index],
                      );
                    }),
              ),
            ),
            InputField()
          ],
        ),
      ),
    );
  }
}

Widget getMyCardView(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return CardView(horizontal: 100, vertical: 25);
  } else
    return CardView(horizontal: 15, vertical: 15);
}
