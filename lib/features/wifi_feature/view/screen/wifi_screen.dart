import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_app/features/wifi_feature/logic/controller/wifi_controller.dart';

class UpdateScreen extends StatelessWidget {
  final UpdateController controller = Get.put(UpdateController());

  UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update App')),
      body: Obx(() {
        return Center(
          child: controller.isDownloading.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: controller.downloadProgress.value,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Downloading: ${(controller.downloadProgress.value * 100).toStringAsFixed(2)}%',
                    ),
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    controller.sendProcessorType(
                      '192.168.1.100',
                      'arm64-v8a',
                    );
                  },
                  child: const Text('Send Processor Type'),
                ),
        );
      }),
    );
  }
}
