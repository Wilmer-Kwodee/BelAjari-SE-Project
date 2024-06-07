import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/User/User.dart';
import 'package:flutter_app_testing/backend/repository/user/user_repository.dart';

class UserHandler {
  static Future<User?> getUserByUid(String uid) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      QuerySnapshot querySnapshot =
          await users.where('uid', isEqualTo: uid).get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        User user =
            User.fromMap(documentSnapshot.data() as Map<String, dynamic>);
        return user;
      } else {
        print('User not found with UID: $uid');
        return null;
      }
    } catch (error) {
      print('Failed to get user by UID: $error');
      return null;
    }
  }
}
