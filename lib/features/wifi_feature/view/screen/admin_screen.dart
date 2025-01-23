import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_app/features/wifi_feature/logic/controller/admin_controller.dart';

class AdminPage extends StatelessWidget {
  final controller = Get.put(AdminController());

  AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Panel")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => controller.startServer(),
          child: const Text("Start Server"),
        ),
      ),
    );
  }
}
