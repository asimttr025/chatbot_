
import 'package:chatbot/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/src/provider.dart';

class FirebaseClients {

  Future setConversation() async {
    print("object");
    FirebaseFirestore.instance.collection('Interview').doc("user").set({
      'messages': ["test,test", "test"]
    });
  }

  @override
  void close() {}
}