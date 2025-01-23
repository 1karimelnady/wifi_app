import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wifi_app/services/file_services.dart';
import 'package:wifi_app/services/network_services.dart';
import '../../models/device_info.dart';

class AppController extends GetxController {
  final NetworkService _networkService = NetworkService();
  final FileService _fileService = FileService();

  var progress = 0.obs;
  var isDownloading = false.obs;
  var errorMessage = ''.obs;

  Future<void> sendDeviceInfo(String adminIp, DeviceInfo deviceInfo) async {
    try {
      errorMessage.value = '';
      await _networkService.sendDeviceInfo(adminIp, deviceInfo);
    } catch (e) {
      errorMessage.value = 'Failed to send device info: $e';
    }
  }

  Future<void> downloadApk(
      BuildContext context, String adminIp, String processorType) async {
    isDownloading.value = true;
    errorMessage.value = '';

    try {
      final filePath = await _networkService.downloadApk(
        adminIp,
        processorType,
        (int progressValue) {
          progress.value = progressValue;
        },
      );

      await _fileService.installApk(context, filePath);

      await _fileService.deleteApk(filePath);

      isDownloading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to download or install APK: $e';
      isDownloading.value = false;
    }
  }
}
