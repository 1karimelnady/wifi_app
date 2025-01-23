import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';

import 'package:path_provider/path_provider.dart';

class UpdateController extends GetxController {
  var downloadProgress = 0.0.obs;
  var isDownloading = false.obs;

  void sendProcessorType(String adminIp, String processorType) async {
    try {
      isDownloading.value = true;
      final url = Uri.parse('http://$adminIp/api/sendProcessorType');
      final response =
          await http.post(url, body: {'processorType': processorType});

      if (response.statusCode == 200) {
        final apkUrl = response.body;
        await downloadAndInstallApk(apkUrl);
      } else {
        Get.snackbar('Error', 'Failed to send processor type');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isDownloading.value = false;
    }
  }

  Future<void> downloadAndInstallApk(String apkUrl) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/update.apk';

    final dio = Dio();
    await dio.download(
      apkUrl,
      filePath,
      onReceiveProgress: (received, total) {
        downloadProgress.value = received / total;
      },
    );

    await OpenFile.open(filePath);
    File(filePath).deleteSync();
  }
}
