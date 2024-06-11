import 'package:flutter_app_testing/backend/model/chat/chat_payload.dart';

class ChatLog {
  String senderId;
  String receiverId;
  List<ChatPayload> messages;

  ChatLog({
    required this.senderId,
    required this.receiverId,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'messages': messages.map((message) => message.toMap()).toList(),
    };
  }

  factory ChatLog.fromMap(Map<String, dynamic> map) {
    return ChatLog(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      messages: List<ChatPayload>.from(map['messages']?.map((item) => ChatPayload.fromMap(item))),
    );
  }
}
