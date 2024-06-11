import 'package:flutter_app_testing/backend/model/user/tutor.dart';
import 'package:flutter_app_testing/backend/repository/user/tutor_repository.dart';

class TutorHandler{
    static Future<void> addTutorData({required Tutor tutor}) async{
      await TutorRepository
      .addTutorData(tutor: tutor);
  }
}