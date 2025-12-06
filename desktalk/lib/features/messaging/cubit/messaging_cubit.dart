import 'dart:math';

import 'package:desktalk/features/messaging/data/message_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../data/message_model.dart';
import '../data/message_repository.dart';
import 'messaging_state.dart';

class MessagingCubit extends Cubit<MessagingState> {
  final MessageRepository repo;
  final _uuid = Uuid();

  MessagingCubit({required this.repo}) : super(MessagingState.initial()) {
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    final loaded = await repo.loadMessages();
    emit(state.copyWith(messages: loaded));
  }

  // Notification badge logic
  void markAsSeen() {
    emit(state.copyWith(unreadCount: 0));
  }

  // Add text message
  void sendText(String text, {MessageType type = MessageType.text}) {
    _addMessage(Message(id: _uuid.v4(), content: text, type: MessageType.text, isUser: true, timestamp: DateTime.now()));

    _simulateReply(content: text, type: type);
  }

  // Add emoji message
  void sendEmoji(String emoji) {
    _addMessage(Message(id: _uuid.v4(), content: emoji, type: MessageType.emoji, isUser: true, timestamp: DateTime.now()));

    _simulateReply(content: emoji, type: MessageType.emoji);
  }

  // Add image message
  void sendImage(String imagePath) {
    _addMessage(Message(id: _uuid.v4(), content: imagePath, type: MessageType.image, isUser: true, timestamp: DateTime.now()));

    _simulateReply(content: imagePath, type: MessageType.image);
  }

  void _addMessage(Message message) {
    final updated = [...state.messages, message];
    emit(state.copyWith(messages: updated, unreadCount: state.unreadCount + 1));

    repo.saveMessages(updated); // persist
  }

  void _simulateReply({required String content, required MessageType type}) async {
    await Future.delayed(Duration(seconds: 1 + Random().nextInt(2)));

    Message reply;

    switch (type) {
      case MessageType.image:
        reply = Message(id: _uuid.v4(), content: "We are processing your image. Once ready, we will email you back.", type: MessageType.text, isUser: false, timestamp: DateTime.now());
        break;

      case MessageType.emoji:
        const emojis = ['😊', '😂', '👍', '❤️', '🤔', '🎉'];
        reply = Message(id: _uuid.v4(), content: emojis[Random().nextInt(emojis.length)], type: MessageType.emoji, isUser: false, timestamp: DateTime.now());
        break;

      case MessageType.text:
        reply = MessageHelper.generateReply(content, _uuid.v4());
        break;
    }

    _addMessage(reply);
  }
}
