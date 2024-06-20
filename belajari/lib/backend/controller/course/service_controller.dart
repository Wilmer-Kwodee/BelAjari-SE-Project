import 'package:flutter_app_testing/backend/handler/course/service_handler.dart';
import 'package:flutter_app_testing/backend/model/transaction/service.dart';

class ServiceController {
  static Future<List<Service>> getServices() async{
    return await ServiceHandler.getServices();
  }
}
