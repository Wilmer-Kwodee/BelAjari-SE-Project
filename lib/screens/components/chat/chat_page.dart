import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final Icon icon;

  const ChatPage({required this.name, required this.icon, super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<Map<String, String>> _messages;
  final TextEditingController _controller = TextEditingController();
  
  @override
  void initState() {
    super.initState();
    _messages = [
      {"sender": widget.name, "message": "Hello!"},
      {"sender": "Me", "message": "Hi, how are you?"},
      {"sender": widget.name, "message": "I'm good, thanks!"},
    ];
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({"sender": "Me", "message": _controller.text});
        _messages.add({"sender": widget.name, "message": "Hi!"});
        _controller.clear();
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          widget.icon,
          const SizedBox(width: 10),
          Text(widget.name),
        ]),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(
                    message["message"]!,
                    style: TextStyle(
                      color: message["sender"] == "Me" ? Colors.blue : Colors.black,
                    ),
                  ),
                  subtitle: Text(message["sender"]!),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
