import 'package:flutter/material.dart';

class SendMessageView extends StatelessWidget {
  final Function(String) onSend;
  const SendMessageView({super.key, required this.onSend});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageController = TextEditingController();

    return Container(
      height: 70,
      color: Colors.deepOrangeAccent,
      child: Row(
        children: [
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              if (messageController.text.isNotEmpty) {
                onSend(messageController.text);
                messageController.text = "";
              }
              FocusManager.instance.primaryFocus?.unfocus();
            },
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 8)
        ],
      ),
    );
  }
}
