import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'download_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WIFI App Updater')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => DownloadScreen());
          },
          child: Text('Start Update'),
        ),
      ),
    );
  }
}
