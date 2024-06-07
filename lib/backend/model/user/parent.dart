class Parent {
  String userId;
  List<String> studentNik;

  Parent({
    required this.userId,
    required this.studentNik,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'studentNik': studentNik,
    };
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return Parent(
      userId: map['userId'],
      studentNik: List<String>.from(map['studentNik']),
    );
  }
}
