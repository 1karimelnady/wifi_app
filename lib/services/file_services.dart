import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileService {
  Future<void> installApk(BuildContext context, String filePath) async {
    const platform = MethodChannel('com.example.wifi_app/install');
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception('APK file does not exist at path: $filePath');
      }

      await platform.invokeMethod('installApk', {'filePath': filePath});
    } on PlatformException catch (e) {
      throw Exception('Failed to install APK: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<void> deleteApk(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    } else {
      print('APK file does not exist at path: $filePath');
    }
  }
}
