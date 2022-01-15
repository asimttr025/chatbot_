import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ChatModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<ChatMessage> _chatMessages = [
    ChatMessage(text: "Hello, I will be conducting your interview today.\nTo know you better could you give me your full name?", isSender: false),
  ];
  String userMail = "";


  Future<ChatMessage> getBotResponse(String senderId, String message) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:5005/webhooks/rest/webhook'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept",
      },
      body: jsonEncode(<String, String>{
        'sender': senderId,
        'message': message
      }),
    );
    print(response.body.toString());
    final List liste = json.decode(response.body);
    final Map<String, dynamic> map = liste[0];
    ChatMessage incomingMessage = ChatMessage.fromMap(map);
    return incomingMessage;

  } on Exception catch (e) {
    print(e);
    throw e;
    }
  }

  List<ChatMessage> get getAllMessages => _chatMessages;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ChatMessage> get items =>
      UnmodifiableListView(_chatMessages);

  /// Adds [chatMessage] to chat. This and [removeAll] are the only ways to modify the
  /// _chatMessages from the outside.
  void addMessagesToChat(ChatMessage chatMessage) async {
    _chatMessages.add(chatMessage);
    final ChatMessage response = await getBotResponse("test", chatMessage.text);
    _chatMessages.add(response);
    print(chatMessage.text);
    notifyListeners();
  }

  String get getUser => userMail;

  void addMailtoUser(String mail) async {
    userMail = mail;
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _chatMessages.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
