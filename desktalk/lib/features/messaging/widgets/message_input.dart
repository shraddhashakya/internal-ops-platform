import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MessageInput extends StatefulWidget {
  final Function(String) onSendText;
  final Function(String) onSendImage;

  const MessageInput({super.key, required this.onSendText, required this.onSendImage});

  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _sendText() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    widget.onSendText(text);
    _controller.clear();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      widget.onSendImage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image button
        IconButton(icon: const Icon(Icons.image), onPressed: _pickImage),

        // Text input
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: "Type a message...", border: OutlineInputBorder()),
          ),
        ),

        // Send button
        IconButton(icon: const Icon(Icons.send), onPressed: _sendText),
      ],
    );
  }
}
