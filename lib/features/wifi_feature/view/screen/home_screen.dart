import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_app/features/wifi_feature/logic/controller/download_controller.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(DownloadController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("APK Downloader")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.startDownload(value),
              decoration:
                  const InputDecoration(labelText: "Enter Processor Type"),
            ),
            const SizedBox(height: 20),
            Obx(() => Text("Download Progress: ${controller.progress.value}%")),
          ],
        ),
      ),
    );
  }
}
