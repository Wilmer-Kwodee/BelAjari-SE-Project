import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart';
import 'package:flutter_app_testing/backend/model/user/tutor.dart';

class TutorRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<void> addTutorData({required Tutor tutor}) async {
    try {
      CollectionReference tutors = firestore.collection('tutors');
      DocumentReference docRef = await tutors.add({
        'userId': tutor.userId,
        'description': tutor.description,
        'introductionVideoUrl': tutor.introductionVideoUrl,
        'cvUrl': tutor.cvUrl,
        'certificateUrls': tutor.certificateUrls,
        'balance': tutor.balance,
        'serviceIds': tutor.serviceIds,
        'phoneNumber': tutor.phoneNumber,
      });
      await docRef.update({
        'tutorId': docRef.id,
      });

      print('Data added successfully!');
    } catch (error) {
      print('Failed to add data: $error');
    }
  }

  static Future<Tutor?> getTutorByUserId(String userId) async {
    try {
      CollectionReference tutors = firestore.collection('tutors');
      QuerySnapshot querySnapshot =
          await tutors.where('userId', isEqualTo: userId).get();

      if (querySnapshot.docs.isNotEmpty) {
        var parentDoc = querySnapshot.docs.first;
        return Tutor.fromMap(parentDoc.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching tutor: $e');
      return null;
    }
  }

  static Future<List<Tutor>> getAllTutors() async {
    try {
      CollectionReference tutors = firestore.collection('tutors');
      QuerySnapshot querySnapshot = await tutors.get();

      List<Tutor> tutorsList = querySnapshot.docs.map((doc) {
        return Tutor.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
      print(tutorsList);
      return tutorsList;
    } catch (e) {
      print('Error fetching tutors: $e');
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getTutorsWithUserDetails() async {
    try {
      List<Tutor> tutors = await getAllTutors();
      
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference users = firestore.collection('users');
      QuerySnapshot userSnapshot = await users.get();


      Map<String, User> userMap = {
        for (var doc in userSnapshot.docs)
          (doc.data() as Map<String, dynamic>)['userId']: User.fromMap(doc.data() as Map<String, dynamic>)
      };

      // Combine tutor and user details
      List<Map<String, dynamic>> combinedList = tutors.map((tutor) {
        User user = userMap[tutor.userId]!;
        return {
          'tutor': tutor,
          'user': user,
        };
      }).toList();

      return combinedList;
    } catch (e) {
      print('Error fetching combined tutor and user details: $e');
      return [];
    }
  }
}
