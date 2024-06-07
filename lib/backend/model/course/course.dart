class Course {
  String courseId;
  String courseName;
  String courseLogoUrl;
  List<String> courseTags; 

  Course({
    required this.courseId,
    required this.courseName,
    required this.courseLogoUrl,
    required this.courseTags,
  });

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'courseName': courseName,
      'courseLogoUrl': courseLogoUrl,
      'courseTags': courseTags,
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'],
      courseName: map['courseName'],
      courseLogoUrl: map['courseLogoUrl'],
      courseTags: List<String>.from(map['courseTags']),
    );
  }
}
