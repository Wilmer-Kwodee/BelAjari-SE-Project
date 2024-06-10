class Subtopic {
  String description;
  String title;
  String videoUrl;

  Subtopic({
    required this.description,
    required this.title,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'title': title,
      'videoUrl': videoUrl,
    };
  }

  factory Subtopic.fromMap(Map<String, dynamic> map) {
    return Subtopic(
      description: map['description'],
      title: map['title'],
      videoUrl: map['videoUrl'],
    );
  }
}
