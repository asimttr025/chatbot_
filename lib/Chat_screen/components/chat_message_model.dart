class ChatMessage {
  final String text;
  final bool isSender;

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
