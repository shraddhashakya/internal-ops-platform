import 'dart:math';
import 'agent_replies.dart'; // your list of 200 generic replies
import 'message_model.dart';

class MessageHelper {
  // --------------------------
  // Regex patterns
  // --------------------------
  // static final RegExp textRegex =
  //     RegExp(r'^[\w\d\s.,!?\'"@#\$%&()*+-/:;]+$');

  static final RegExp unicodeTextRegex = RegExp(r'^[\p{L}\p{N}\p{P}\p{Zs}]+$', unicode: true);

  static final RegExp emojiRegex = RegExp(r'^[\u2190-\u21FF\u2600-\u27BF\u1F300-\u1F6FF\u1F900-\u1F9FF]+$', unicode: true);

  static final RegExp urlRegex = RegExp(r'https?:\/\/(www\.)?[a-zA-Z0-9\-_]+\.[a-zA-Z]{2,}([\/\w\-\.\?=&%]*)?');

  // --------------------------
  // Generate a simulated agent reply
  // --------------------------
  static Message generateReply(String userMessage, String uuid) {
    userMessage = userMessage.toLowerCase();

    // Keyword-based replies
    if (userMessage.contains('hello')) {
      return _createMessage("Hello! 😊 Hope you're having a great day!", uuid);
    }

    if (userMessage.contains('help')) {
      return _createMessage("Sure! Please contact our support at +1-800-123-4567.", uuid);
    }

    if (userMessage.contains('thanks')) {
      return _createMessage("You're welcome! Let me know if you need anything else.", uuid);
    }

    // URL detected
    if (urlRegex.hasMatch(userMessage)) {
      return _createMessage("I see you shared a link. I'll check it out!", uuid);
    }

    // Emoji-only message
    if (emojiRegex.hasMatch(userMessage)) {
      return _createMessage("Nice emoji! 😄", uuid);
    }

    // Default: random generic reply from your 200-reply list
    final random = Random();
    final replyText = agentReplies[random.nextInt(agentReplies.length)];
    return _createMessage(replyText, uuid);
  }

  // --------------------------
  // Private helper to create a Message
  // --------------------------
  static Message _createMessage(String text, String uuid) {
    return Message(id: uuid, content: text, type: MessageType.text, isUser: false, timestamp: DateTime.now());
  }
}
