class User {
  String userId;
  String name;
  int age;
  String email;
  String role;
  String uid;
  String pictureUrl;

  User(
      {required this.userId,
      required this.name,
      required this.age,
      required this.email,
      required this.role,
      required this.uid,
      required this.pictureUrl,
      });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'age': age,
      'email': email,
      'role': role,
      'uid': uid,
      'pictureUrl': pictureUrl  
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      name: map['name'],
      age: map['age'],
      email: map['email'],
      role: map['role'],
      uid: map['uid'],
      pictureUrl: map['pictureUrl'],
    );
  }
}
