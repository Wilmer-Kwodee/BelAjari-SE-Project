import 'package:flutter_app_testing/backend/model/transaction/service.dart';
import 'package:flutter_app_testing/backend/repository/course/service_repository.dart';

class ServiceHandler{
  static Future<List<Service>> getServices(){
    return ServiceRepository.getServices();
  }
}