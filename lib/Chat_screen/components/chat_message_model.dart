class ChatMessage {
  final String text;
  final bool isSender;

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      text: map['text'] ?? '',
      isSender: false,
    );
  }

  ChatMessage({
    required this.text,
    required this.isSender,
  });
}

void printList(List<dynamic> list) {
  String sender;
  for (int i = 0; i < list.length; i++) {
    if (list[i].isSender == false) {
      sender = "chatbot";
    } else {
      sender = "user";
    }
    print(list[i].text + " *** sendet by --> " + sender);
  }
}
