class Rating {
  String userId;
  String tutorId;
  int stars;
  String description;

  Rating({
    required this.userId,
    required this.tutorId,
    required this.stars,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'tutorId': tutorId,
      'stars': stars,
      'description': description,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      userId: map['userId'],
      tutorId: map['tutorId'],
      stars: map['stars'],
      description: map['description'],
    );
  }
}
