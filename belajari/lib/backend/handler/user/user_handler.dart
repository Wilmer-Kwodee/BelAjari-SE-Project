import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart';

class UserHandler {
  static Future<User?> getUserByUid(String uid) async {
  
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');

      print(uid);
      // QuerySnapshot data = await users.get();
      // for (QueryDocumentSnapshot doc in data.docs){
      //   print(doc.data());
      // }

      QuerySnapshot querySnapshot = await users.where('uid', isEqualTo: uid).get();
      print(querySnapshot.docs.first.data());

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        print('wow');
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
