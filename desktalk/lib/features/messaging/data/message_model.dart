enum MessageType { text, emoji, image }

class Message {
  final String id;
  final String content;
  final MessageType type;
  final bool isUser;
  final DateTime timestamp;

  Message({required this.id, required this.content, required this.type, required this.isUser, required this.timestamp});

  Map<String, dynamic> toJson() => {"id": id, "content": content, "type": type.index, "isUser": isUser, "timestamp": timestamp.millisecondsSinceEpoch};

  static Message fromJson(Map<String, dynamic> json) {
    return Message(id: json["id"], content: json["content"], type: MessageType.values[json["type"]], isUser: json["isUser"], timestamp: DateTime.fromMillisecondsSinceEpoch(json["timestamp"]));
  }
}
