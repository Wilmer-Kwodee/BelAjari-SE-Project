import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/components/chat/chat_page.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            MessageHeader(),
            SizedBox(height: 20),
            Text(
              'Your Chats',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            ChatTile(
              name: 'Andy',
              icon: Icons.restore_from_trash_rounded,
              iconColor: Colors.pink,
              backgroundColor: Colors.pinkAccent,
            ),
            ChatTile(
              name: 'Budy',
              icon: Icons.bug_report,
              iconColor: Colors.lime,
              backgroundColor: Colors.limeAccent,
            ),
            ChatTile(
              name: 'Caddy',
              icon: Icons.person,
              iconColor: Colors.green,
              backgroundColor: Colors.greenAccent,
            ),
            ChatTile(
              name: 'Daddy',
              icon: Icons.logout,
              iconColor: Colors.blue,
              backgroundColor: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class MessageHeader extends StatelessWidget {
  const MessageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Messages',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
    ));
  }
}

class ChatTile extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const ChatTile({
    required this.name,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        width: 40,
        height: 40,
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
      title: Text(name),
      onTap: () => _navigateToChatPage(context),
    );
  }

  void _navigateToChatPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatPage(name: name, icon: Icon(icon, color:iconColor)),
      ),
    );
  }
}
