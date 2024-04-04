import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
          title: const Row(
            children: [
              SizedBox(
                width: 60,
              ),
              Text('user_name'),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return _buildListOfUser();
            }));
  }

  //widget for all user name and profile image chats ui
  Widget _buildListOfUser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent, // Make background transparent
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Apply circular border radius
              child: Image.network(
                "https://th.bing.com/th/id/OIP.ppmhXBoJnW7ZF1VK-IMJUwHaI2?rs=1&pid=ImgDetMain",
                width: 40, // Adjust image width as needed
                height: 40, // Adjust image height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Add some spacing between the image and text
          Text(
            "user_name",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
