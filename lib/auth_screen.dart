import 'package:chat_app/home_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController authController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(
              "https://static.vecteezy.com/system/resources/previews/000/561/457/original/chat-app-logo-icon-vector.jpg"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: authController,
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 1),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              child: Container(
                height: 50,
                color: Colors.orange,
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(color: Color(0xff444444), fontWeight: FontWeight.bold),
                )),
              ),
              onTap: () {
                if (authController.text.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const HomeScreen();
                  }));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Your name is requierd to continue"),
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
