import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/components/auth/login_page.dart';
import 'package:flutter_app_testing/screens/components/auth/register_page.dart';
import 'package:flutter_app_testing/screens/components/course/course_page.dart';
import 'package:flutter_app_testing/screens/main/home_screen.dart';

class RouteWrapper {
  static Map<String, WidgetBuilder> get routes {
    return {
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/home': (context) => HomeScreen(),
      '/course_page' : (context) => CoursePage(),
      
    };
  }
}
