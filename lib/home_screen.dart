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
  List<Chat> myList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: const Text(
          "Whatsapp",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/background.jpg",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(87, 0, 0, 0),
          ),
          GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SafeArea(
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
                                      MessageView(
                                        text: myList[index].message,
                                        date: myList[index].date,
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      MessageView(
                                        text: myList[index].message,
                                        date: myList[index].date,
                                      ),
                                      Expanded(child: Container()),
                                    ],
                                  ),
                          );
                        }),
                  ),
                  SendMessageView(
                    onSend: (message) {
                      myList.add(Chat(fromMe: true, message: message, date: DateTime.now().toString()));
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
