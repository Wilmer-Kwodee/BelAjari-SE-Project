import 'package:flutter_app_testing/backend/model/course/course.dart';
import 'package:flutter_app_testing/backend/repository/course/course_repository.dart';

class CourseHandler{
  static Future<List<Course>> getCourses() async {
    return await CourseRepository.getCourses();
  }
}