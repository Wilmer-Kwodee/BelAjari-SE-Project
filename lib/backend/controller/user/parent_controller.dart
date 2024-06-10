import 'package:flutter_app_testing/backend/controller/user/user_controller.dart';
import 'package:flutter_app_testing/backend/model/user/parent.dart';
import 'package:flutter_app_testing/backend/others/auth/firebase_auth.dart';
import 'package:flutter_app_testing/backend/repository/user/parent_repository.dart';

class ParentController {
    static Future<Parent?> getParentByUserId() async {
    final user = FirebaseAuthService.getCurrentUser();

    if (user == null) {
      print('User is not authenticated.');
      return null;
    }

    try {
      String? userId = await UserController.getUserId();

      if (userId == null){
        return null;
      }
      else{
        return await ParentRepository.getParentByUserId(userId);
      }
      
    } catch (error) {
      print('Failed to get UID: $error');
    }

    return null;
  }
}