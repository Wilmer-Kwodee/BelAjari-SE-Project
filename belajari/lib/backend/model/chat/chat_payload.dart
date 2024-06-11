class ChatPayload {
  String message;
  DateTime createdAt;

  ChatPayload({
    required this.message,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ChatPayload.fromMap(Map<String, dynamic> map) {
    return ChatPayload(
      message: map['message'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
