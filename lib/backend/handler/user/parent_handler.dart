import 'package:flutter_app_testing/backend/model/user/parent.dart';
import 'package:flutter_app_testing/backend/repository/user/parent_repository.dart';

class ParentHandler {
  static Future<void> addParentData({required Parent parent}) {
    return ParentRepository.addParentData(parent: parent);
  }
}