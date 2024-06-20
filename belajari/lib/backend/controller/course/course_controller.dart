import 'package:flutter_app_testing/backend/handler/course/course_handler.dart';
import 'package:flutter_app_testing/backend/model/course/course.dart';
import 'package:flutter_app_testing/backend/model/course/subtopic.dart';
import 'package:flutter_app_testing/backend/model/schedule/schedule.dart';
import 'package:flutter_app_testing/backend/model/session/session.dart';
import 'package:flutter_app_testing/backend/model/session/session_materials.dart';
import 'package:flutter_app_testing/backend/model/session/session_state.dart';

class CourseController {
  static Future<List<Course>> getCourses() async{
    return await CourseHandler.getCourses();
  }
}
