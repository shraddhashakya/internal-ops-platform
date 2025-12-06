import 'message_storage.dart';
import 'message_model.dart';

class MessageRepository {
  final MessageStorage storage;

  MessageRepository(this.storage);

  Future<List<Message>> loadMessages() => storage.loadMessages();
  Future<void> saveMessages(List<Message> list) => storage.saveMessages(list);
}
