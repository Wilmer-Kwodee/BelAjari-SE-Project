import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/components/auth/login_page.dart';
import 'package:flutter_app_testing/screens/components/auth/register_page.dart';
import 'package:flutter_app_testing/screens/components/course/course_page.dart';
import 'package:flutter_app_testing/screens/components/search/tutor/tutor_page.dart';
import 'package:flutter_app_testing/screens/components/user/tutor/interview_page.dart';
import 'package:flutter_app_testing/screens/components/user/tutor/upload_documents.dart';
import 'package:flutter_app_testing/screens/main/home_screen.dart';

class RouteWrapper {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/home': (context) => HomeScreen(),
      '/course_page' : (context) => CoursePage(),
      '/interview' : (context) => InterviewPage(),
      '/uploadDocuments' : (context) => UploadDocuments(),
      '/tutors_page' : (context) => TutorPage(),
    };
  }
}
