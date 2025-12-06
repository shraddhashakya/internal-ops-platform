import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/messaging_cubit.dart';
import 'cubit/messaging_state.dart';
import 'widgets/message_bubble.dart';
import 'widgets/message_input.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MessagingCubit, MessagingState>(
      listener: (context, state) {
        /// Scroll to bottom when new messages arrive
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Support Chat")),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(message: state.messages[index]);
                  },
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MessageInput(onSendText: (text) => context.read<MessagingCubit>().sendText(text), onSendImage: (text) => context.read<MessagingCubit>().sendImage(text)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
