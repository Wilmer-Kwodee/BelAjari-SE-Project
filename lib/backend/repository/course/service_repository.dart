import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_testing/backend/model/course/course.dart';
import 'package:flutter_app_testing/backend/model/transaction/service.dart';

class ServiceRepository {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<Service>> getServices() async {
    try {
      CollectionReference serviceCollection = _firestore.collection('services');
      QuerySnapshot querySnapshot = await serviceCollection.get();

      List<Service> services = querySnapshot.docs.map((doc) {
        return Service.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();

      return services;
    } catch (e) {
      print('Error fetching services: $e');
      throw e;
    }
  }
}
