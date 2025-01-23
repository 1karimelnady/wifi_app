// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:io';

// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:android_intent/android_intent.dart';
// import 'package:android_intent/flag.dart';

// class FileService {
//   Future<void> downloadFile(String url, String fileName) async {
//     try {
//       // تنزيل الملف من الرابط المحدد
//       final response = await http.get(Uri.parse(url));
//       final dir = await getApplicationDocumentsDirectory();
//       final file = File('${dir.path}/$fileName');

//       // كتابة البيانات إلى الملف
//       await file.writeAsBytes(response.bodyBytes);

//       // تثبيت الـ APK بعد التنزيل
//       await installApk(file.path);

//       // حذف الملف بعد التثبيت (يمكنك تعديل هذا إذا كنت تريد الاحتفاظ بالملف)
//       await file.delete();
//     } catch (e) {
//       print('Error downloading or installing APK: $e');
//     }
//   }

//   Future<void> installApk(String filePath) async {
//     final intent = AndroidIntent(
//       action: 'android.intent.action.VIEW',
//       data: Uri.parse('file://$filePath').toString(),
//       package: 'com.android.packageinstaller',
//       flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
//     );
//     await intent.launch();
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class FileService {
  /// Installs the APK using a platform channel.
  Future<void> installApk(BuildContext context, String filePath) async {
    const platform = MethodChannel('com.example.wifi_app/install');
    try {
      // استخدم FileProvider للحصول على الـ URI للملف
      final file = File(filePath);
      final fileUri = Uri.file(filePath);

      // استدعاء طريقة التثبيت عبر القناة
      await platform
          .invokeMethod('installApk', {'fileUri': fileUri.toString()});
    } catch (e) {
      throw Exception('Failed to install APK: $e');
    }
  }

  /// Deletes the APK file after installation.
  Future<void> deleteApk(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}
