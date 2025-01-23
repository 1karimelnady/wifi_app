import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DownloadService {
  Future<String?> requestApk(String processorType) async {
    final adminUrl = 'http://192.168.1.100:5000/request-apk';
    final response = await http.post(
      Uri.parse(adminUrl),
      body: processorType,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['apkUrl'];
    }
    return null;
  }

  Future<void> downloadAPK(String apkUrl, Function(int, int) onProgress) async {
    try {
      final request = await HttpClient().getUrl(Uri.parse(apkUrl));
      final response = await request.close();

      final contentLength = response.contentLength;
      final bytes = <int>[];
      var receivedLength = 0;

      await for (var data in response) {
        bytes.addAll(data);
        receivedLength += data.length;
        onProgress(receivedLength, contentLength);
      }

      // Save APK to local storage
      final apkFile = File('/storage/emulated/0/Download/app.apk');
      await apkFile.writeAsBytes(bytes);

      // Install APK
      await installAPK(apkFile.path);

      // Delete APK after installation
      await apkFile.delete();
    } catch (e) {
      throw Exception("Failed to download APK: $e");
    }
  }

  Future<void> installAPK(String apkPath) async {
    // Use a package like `flutter_apk_installer` to install the APK
    // Example: await FlutterApkInstaller.installApk(apkPath);
  }
}
