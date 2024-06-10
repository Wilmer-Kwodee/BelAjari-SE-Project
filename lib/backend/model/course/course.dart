import 'package:flutter_app_testing/backend/model/course/subtopic.dart';

class Course {
  String courseId;
  String courseName;
  String courseLogoUrl;
  List<String> courseTags;
  List<Subtopic> subtopic; // Updated to List<Subtopic>

  Course({
    required this.courseId,
    required this.courseName,
    required this.courseLogoUrl,
    required this.courseTags,
    this.subtopic = const [], 
  });

  Map<String, dynamic> toMap() {
    return {
      'courseId': courseId,
      'courseName': courseName,
      'courseLogoUrl': courseLogoUrl,
      'courseTags': courseTags,
      'subtopic': subtopic.map((subtopic) => subtopic.toMap()).toList(),
    };
  }

  factory Course.fromMap(Map<String, dynamic> map) {
    return Course(
      courseId: map['courseId'],
      courseName: map['courseName'],
      courseLogoUrl: map['courseLogoUrl'],
      courseTags: List<String>.from(map['courseTags']),
      subtopic: (map['subtopic'] as List<dynamic>)
          .map((subtopicMap) => Subtopic.fromMap(subtopicMap as Map<String, dynamic>))
          .toList(),
    );
  }

  void printDetails() {
    print('Course ID: $courseId');
    print('Course Name: $courseName');
    print('Course Logo URL: $courseLogoUrl');
    print('Course Tags: $courseTags');
    print('Subtopics:');
    for (var subtopic in subtopic) {
      print('  - ${subtopic.title}: ${subtopic.description} (${subtopic.videoUrl})');
    }
  }
}
