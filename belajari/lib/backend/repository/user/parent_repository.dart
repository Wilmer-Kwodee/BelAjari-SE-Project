import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/user/parent.dart';

class ParentRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addParentData({required Parent parent}) async {
    try {
      CollectionReference parents = firestore.collection('parents');
      DocumentReference docRef = await parents.add({
        'userId': parent.userId,
        'studentNik': parent.studentNik,
        'phoneNumber': parent.phoneNumber
      });
      await docRef.update({
        'parentId': docRef.id,
      });

      print('Data added successfully!');
    } catch (error) {
      print('Failed to add data: $error');
    }
  }

  static Future<Parent?> getParentByUserId(String userId) async {
    try {
      CollectionReference parents = firestore.collection('parents');
      QuerySnapshot querySnapshot =
          await parents.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        var parentDoc = querySnapshot.docs.first;
        return Parent.fromMap(parentDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching parent: $e');
      return null;
    }
  }
}
