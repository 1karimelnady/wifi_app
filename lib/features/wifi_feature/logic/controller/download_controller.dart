import 'package:get/get.dart';

import 'package:wifi_app/core/services/download_services.dart';

class DownloadController extends GetxController {
  var progress = 0.0.obs;
  final downloadService = DownloadService();

  void startDownload(String processorType) async {
    if (processorType.isEmpty) {
      Get.snackbar("Error", "Please enter processor type");
      return;
    }

    final apkUrl = await downloadService.requestApk(processorType);
    if (apkUrl != null) {
      await downloadService.downloadAPK(apkUrl, (received, total) {
        progress.value = ((received / total) * 100);
      });
    } else {
      Get.snackbar("Error", "Failed to get APK URL");
    }
  }
}
