class ChatMessage {
  final String text;
  final bool isSender;

  ChatMessage({
    required this.text,
    required this.isSender,
  });
}

List chatMessages = [
  ChatMessage(text: "Hello, How are you?", isSender: false),
  ChatMessage(text: "Good,Thanks! you?", isSender: true),
  ChatMessage(text: "Fine fineee", isSender: false),
  ChatMessage(text: "coo coo cooolcocol", isSender: true),
];

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
