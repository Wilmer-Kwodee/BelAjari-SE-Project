import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/course/course.dart';

class CourseRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Course>> getCourses() async {
    try {
      CollectionReference coursesCollection = _firestore.collection('courses');
      QuerySnapshot querySnapshot = await coursesCollection.get();

      List<Course> courses = querySnapshot.docs.map((doc) {
        return Course.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      for (Course course in courses){
        course.printDetails();
      }

      return courses;
    } catch (e) {
      print('Error fetching courses: $e');
      throw e; 
    }
  }
}
