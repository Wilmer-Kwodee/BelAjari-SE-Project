class Parent {
  String parentId;
  String userId;
  List<String> studentNik;
  String phoneNumber;

  Parent({
    required this.parentId,
    required this.userId,
    required this.studentNik,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'parentId': parentId,
      'userId': userId,
      'studentNik': studentNik,
      'phoneNumber': phoneNumber
    };
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return Parent(
      parentId: map['parentId'],
      userId: map['userId'],
      studentNik: List<String>.from(map['studentNik']),
      phoneNumber: map['phoneNumber'],
    );
  }
}
