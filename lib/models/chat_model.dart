import 'dart:collection';

import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:flutter/foundation.dart';

class ChatModel extends ChangeNotifier {
  /// Internal, private state of the cart.
  List<ChatMessage> _chatMessages = [
    ChatMessage(text: "Hello, How are you?", isSender: false),
    ChatMessage(text: "Good,Thanks! you?", isSender: true),
    ChatMessage(text: "Fine fineee", isSender: false),
    ChatMessage(text: "coo coo cooolcocol", isSender: true),
  ];

  List<ChatMessage> get getAllMessages => _chatMessages;

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<ChatMessage> get items =>
      UnmodifiableListView(_chatMessages);

  /// Adds [chatMessage] to chat. This and [removeAll] are the only ways to modify the
  /// _chatMessages from the outside.
  void addMessagesToChat(ChatMessage chatMessage) {
    _chatMessages.add(chatMessage);

    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _chatMessages.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
