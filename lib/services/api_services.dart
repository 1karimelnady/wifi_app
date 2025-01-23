import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String adminIp;

  ApiService(this.adminIp);

  Future<void> sendProcessorType(String processorType) async {
    // كود لإرسال نوع المعالج إلى الهاتف الإداري
    await http.post(Uri.parse('http://$adminIp/sendProcessor'),
        body: {'type': processorType});
  }

  Future<String> getApkUrl(String processorType) async {
    // كود لاستلام رابط الـ APK المناسب لنوع المعالج
    final response =
        await http.get(Uri.parse('http://$adminIp/getApk?type=$processorType'));
    return json.decode(response.body)['url'];
  }
}
