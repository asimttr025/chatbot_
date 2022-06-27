import 'package:chatbot/Chat_screen/components/chat_message_model.dart';
import 'package:chatbot/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';
import 'package:chatbot/models/chat_model.dart';

class FirebaseClients {
  var chat = ChatModel();

  Future setConversation(List<ChatMessage> allChatMessages, String mail) async {
    List<String> allMessages = [];
    for (var item in allChatMessages) {
      allMessages.add(item.text);
    }
    FirebaseFirestore.instance
        .collection('Randevu')
        .doc(mail)
        .set({'messages': allMessages});
  }

  @override
  void close() {}
}
