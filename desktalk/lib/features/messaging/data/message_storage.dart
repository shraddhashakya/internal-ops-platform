import 'package:hive_flutter/hive_flutter.dart';

import '../data/message_model.dart';

class MessageStorage {
  static const boxName = "messages_box";

  Future<List<Message>> loadMessages() async {
    final box = await Hive.openBox(boxName);
    final raw = box.get("messages", defaultValue: []);
    return (raw as List).map((m) => Message.fromJson(Map<String, dynamic>.from(m))).toList();
  }

  Future<void> saveMessages(List<Message> messages) async {
    final box = await Hive.openBox(boxName);
    await box.put("messages", messages.map((m) => m.toJson()).toList());
  }
}
