import 'package:chat_app/models/chat.dart';
import 'package:chat_app/widgets/message_view.dart';
import 'package:chat_app/widgets/send_message_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Chat> myList = [Chat(fromMe: false, message: "test 1"), Chat(fromMe: false, message: "test 2")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "Whatsapp",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myList[index].fromMe
                          ? Row(
                              children: [
                                Expanded(child: Container()),
                                MessageView(text: myList[index].message),
                              ],
                            )
                          : Row(
                              children: [
                                MessageView(text: myList[index].message),
                                Expanded(child: Container()),
                              ],
                            ),
                    );
                  }),
            ),
            SendMessageView(
              onSend: (message) {
                myList.add(Chat(fromMe: true, message: message));
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
