import '../data/message_model.dart';

class MessagingState {
  final List<Message> messages;
  final int unreadCount;

  MessagingState({required this.messages, required this.unreadCount});

  factory MessagingState.initial() => MessagingState(messages: [], unreadCount: 0);

  MessagingState copyWith({List<Message>? messages, int? unreadCount}) {
    return MessagingState(messages: messages ?? this.messages, unreadCount: unreadCount ?? this.unreadCount);
  }
}
