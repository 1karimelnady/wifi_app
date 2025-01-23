import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wifi_app/services/file_services.dart';
import 'package:wifi_app/services/network_services.dart';
import '../../models/device_info.dart';

// class AppController extends GetxController {
//   final NetworkService _networkService = NetworkService();
//   final FileService _fileService = FileService();

//   var progress = 0.obs; // Observable variable for progress
//   var isDownloading = false.obs; // Observable variable for download state
//   var errorMessage = ''.obs; // Observable variable for error message

//   Future<void> sendDeviceInfo(String adminIp, DeviceInfo deviceInfo) async {
//     try {
//       await _networkService.sendDeviceInfo(adminIp, deviceInfo);
//     } catch (e) {
//       errorMessage.value = e.toString();
//     }
//   }

//   Future<void> downloadApk(String adminIp, String processorType) async {
//     isDownloading.value = true;
//     errorMessage.value = '';

//     try {
//       final filePath = await _networkService.downloadApk(
//         adminIp,
//         processorType,
//         (int progress) {
//           this.progress.value = progress;
//         },
//       );

//       await _fileService.installApk(filePath);
//       await _fileService.deleteApk(filePath);

//       isDownloading.value = false;
//     } catch (e) {
//       errorMessage.value = e.toString();
//       isDownloading.value = false;
//     }
//   }
// }
class AppController extends GetxController {
  final NetworkService _networkService = NetworkService();
  final FileService _fileService = FileService();

  var progress = 0.obs; // Observable for progress
  var isDownloading = false.obs; // Observable for download state
  var errorMessage = ''.obs; // Observable for error messages

  /// Sends device information to the admin's phone.
  Future<void> sendDeviceInfo(String adminIp, DeviceInfo deviceInfo) async {
    try {
      errorMessage.value = '';
      await _networkService.sendDeviceInfo(adminIp, deviceInfo);
    } catch (e) {
      errorMessage.value = 'Failed to send device info: $e';
    }
  }

  /// Downloads and installs APK from the admin's phone.
  Future<void> downloadApk(
      BuildContext context, String adminIp, String processorType) async {
    isDownloading.value = true;
    errorMessage.value = '';

    try {
      // Download the APK
      final filePath = await _networkService.downloadApk(
        adminIp,
        processorType,
        (int progressValue) {
          progress.value = progressValue;
        },
      );

      // Install the APK
      await _fileService.installApk(context, filePath);

      // Delete the APK after installation
      await _fileService.deleteApk(filePath);

      isDownloading.value = false;
    } catch (e) {
      errorMessage.value = 'Failed to download or install APK: $e';
      isDownloading.value = false;
    }
  }
}
