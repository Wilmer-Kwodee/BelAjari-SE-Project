class User {
  String name;
  int age;
  String email;
  String role;
  String uid;

  User({required this.name, required this.age, required this.email, required this.role, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'role': role,
      'uid' : uid,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      age: map['age'],
      email: map['email'],
      role: map['role'],
      uid: map['uid'],
    );
  }
}
