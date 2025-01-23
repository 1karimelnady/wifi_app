import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_app/app/controllers/app_controllers.dart';
import 'package:wifi_app/app/widgets/progress_indicator.dart';

class DownloadScreen extends StatelessWidget {
  final AppController _controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Downloading...')),
      body: Obx(() {
        if (_controller.isDownloading.value) {
          return Center(
            child: ProgressBar(progress: _controller.progress.value),
          );
        } else if (_controller.errorMessage.value.isNotEmpty) {
          return Center(
              child: Text('Error: ${_controller.errorMessage.value}'));
        } else {
          return Center(child: Text('Press Start to Download'));
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.downloadApk(context, '192.168.1.1', 'ARM64');
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
