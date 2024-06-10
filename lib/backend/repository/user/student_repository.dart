import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/user/student.dart';

class StudentRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addStudentData({required Student student}) async {
    try {
      CollectionReference students = firestore.collection('students');
      DocumentReference docRef = await students.add({
        'userId': student.userId,
        'nik' : student.nik
      });
      await docRef.update({
        'studentId': docRef.id,
      });

      print('Data added successfully!');
    } catch (error) {
      print('Failed to add data: $error');
    }
  }

    static Future<Student?> getStudentByUserId(String userId) async {
    try {
      CollectionReference students = firestore.collection('students');
      QuerySnapshot querySnapshot =
          await students.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        var parentDoc = querySnapshot.docs.first;
        return Student.fromMap(parentDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching parent: $e');
      return null;
    }
  }
}
