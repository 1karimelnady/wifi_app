import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/device_info.dart';
import 'package:path_provider/path_provider.dart';

class NetworkService {
  Future<void> sendDeviceInfo(String adminIp, DeviceInfo deviceInfo) async {
    final url = Uri.parse('http://$adminIp/sendDeviceInfo');
    try {
      final response = await http.post(
        url,
        body: {
          'processorType': deviceInfo.processorType,
          'deviceName': deviceInfo.deviceName,
        },
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to send device info');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> downloadApk(
    String adminIp,
    String processorType,
    Function(int) onProgress,
  ) async {
    final url =
        Uri.parse('http://$adminIp/downloadApk?processorType=$processorType');

    final request = http.Request('GET', url);
    final response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Failed to download APK');
    }

    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/app_$processorType.apk';
    final file = File(filePath);
    final sink = file.openWrite();

    int received = 0;
    final total = response.contentLength ?? 0;

    await for (var chunk in response.stream) {
      received += chunk.length;
      onProgress((received / total * 100).toInt());
      sink.add(chunk);
    }

    await sink.close();
    return filePath;
  }
}
