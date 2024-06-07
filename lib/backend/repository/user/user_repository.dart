import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/user/role.dart';

class UserRepository {
  static Future<void> addUserData({
    required String name,
    required int age,
    required String email,
    required String role,
    required String uid
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      await users.add({
        'name': name,
        'age': age,
        'email': email,
        'role': role,
        'uid' : uid,
      }); 

      print('Data added successfully!');
    } catch (error) {
      print('Failed to add data: $error');
    }
  }

  static Future<void> updateUserData({
    required String userId,
    required String name,
    required int age,
    required String email,
    required String role,
  }) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      await users.doc(userId).set({
        'name': name,
        'age': age,
        'email': email,
        'role': role,
      });

      print('Data updated successfully!');
    } catch (error) {
      print('Failed to update data: $error');
    }
  }

  static Future<List<Map<String, dynamic>>> getUsersData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      QuerySnapshot querySnapshot = await users.get();
      List<Map<String, dynamic>> userDataList = [];

      querySnapshot.docs.forEach((doc) {
        userDataList.add(doc.data() as Map<String, dynamic>);
      });

      return userDataList;
    } catch (error) {
      print('Failed to get users data: $error');
      return [];
    }
  }
}
