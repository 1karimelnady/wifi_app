import 'package:get/get.dart';
import 'package:wifi_app/core/services/admin_services.dart';

import 'package:wifi_app/features/wifi_feature/data/models/apk_model.dart';

class AdminController extends GetxController {
  var requests = <ApkModel>[].obs;
  final adminService = AdminService();

  void startServer() async {
    await adminService.startServer((request) {
      requests.add(request);
      return adminService.getApkUrlForProcessor(request.processorType);
    });
  }
}
