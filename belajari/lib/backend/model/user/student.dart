class Student {
  String userId;
  String nik;

  Student({
    required this.userId,
    required this.nik,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'nik': nik,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      userId: map['userId'],
      nik: map['nik'],
    );
  }
}
