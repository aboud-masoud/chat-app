import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageView extends StatelessWidget {
  final String text;
  final String date;
  const MessageView({super.key, required this.text, required this.date});

  @override
  Widget build(BuildContext context) {
    final newDate = DateTime.parse(date);
    final DateFormat formatter1 = DateFormat('dd/MM/yyyy');
    final DateFormat formatter2 = DateFormat('hh:mm');

    final String formattedDate = formatter1.format(newDate);
    final String formattedHour = formatter2.format(newDate);

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text),
            Text(
              formattedHour,
              style: const TextStyle(fontSize: 10, color: Color(0xff444444)),
            ),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 10, color: Color(0xff444444)),
            ),
          ],
        ),
      ),
    );
  }
}
