import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  final String text;
  const MessageView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text),
      ),
    );
  }
}
