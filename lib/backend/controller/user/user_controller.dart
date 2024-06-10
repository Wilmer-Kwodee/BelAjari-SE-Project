import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/backend/handler/user/user_handler.dart';
import 'package:flutter_app_testing/backend/model/user/User.dart' as user_model;
import 'package:flutter_app_testing/backend/model/user/role.dart';
import 'package:flutter_app_testing/backend/others/auth/firebase_auth.dart';
import 'package:flutter_app_testing/backend/repository/user/user_repository.dart';

class UserController {
  static Future<user_model.User?> getUser() async {
    final user = FirebaseAuthService.getCurrentUser();

  

    if (user == null) {
      print('User is not authenticated.');
      return null;
    }

    try {
      final uid = user.uid;
    

      final u = await UserHandler.getUserByUid(uid);
      return u;
    } catch (error) {
      print('Failed to get UID: $error');
    }

    return null;
  }

  static Future<String?> getUserId() async {
    final user = FirebaseAuthService.getCurrentUser();
    if (user == null) {
      print('User is not authenticated.');
      return null;
    }

    try {
      final uid = user.uid;
      final u = await UserHandler.getUserByUid(uid);
      return (u as user_model.User).userId;
    } catch (error) {
      print('Failed to get UID: $error');
    }

    return null;
  }

  static Future<AuthResult> registerWithEmailAndPassword({
    required String name,
    required int age,
    required String email,
    required String password,
    required String role,
  }) async {
    AuthResult result = await FirebaseAuthService.registerWithEmailAndPassword(
        email: email, password: password);

    if (result.ok()) {
      await UserRepository.addUserData(
          name: name,
          age: age,
          email: email,
          role: role.toLowerCase(),
          uid: result.user!.uid);
    }
    return result;
  }

  static void logout(BuildContext context) async {
    FirebaseAuthService.signOut();
    Navigator.pushNamed(context, '/login');
  }
}
