import 'dart:io';
import 'package:desktalk/core/theme/colors.dart';
import 'package:flutter/material.dart';
import '../data/message_model.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: isUser ? AppColors.primary : AppColors.secondary, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            _buildContent(isUser),
            const SizedBox(height: 4),
            Text(DateFormat('HH:mm').format(message.timestamp), style: TextStyle(fontSize: 10, color: isUser ? AppColors.textDark : AppColors.textLight)),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(bool isUser) {
    switch (message.type) {
      case MessageType.text:
        return Text(
          message.content,
          style: TextStyle(color: isUser ? AppColors.textDark : AppColors.textLight, fontWeight: FontWeight.w500, fontSize: 15),
        );
      case MessageType.emoji:
        return Text(message.content, style: const TextStyle(fontSize: 32));
      case MessageType.image:
        return Image.file(File(message.content), width: 180);
    }
  }
}
