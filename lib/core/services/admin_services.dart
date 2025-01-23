import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:wifi_app/features/wifi_feature/data/models/apk_model.dart';

class AdminService {
  Future<void> startServer(Function(ApkModel) onRequest) async {
    final server = await HttpServer.bind(InternetAddress.anyIPv4, 5000);
    print('Admin server running on ${server.address.address}:${server.port}');

    await for (HttpRequest request in server) {
      if (request.method == 'POST' && request.uri.path == '/request-apk') {
        // Fix: Explicitly cast the decoder to the expected StreamTransformer type
        final processorType = await request
            .transform(utf8.decoder.cast<Uint8List, String>())
            .join();
        final apkRequest = ApkModel(
          processorType: processorType,
          timestamp: DateTime.now(),
        );

        final apkUrl = onRequest(apkRequest);
        request.response
          ..write(jsonEncode({'apkUrl': apkUrl}))
          ..close();
      } else {
        request.response
          ..statusCode = HttpStatus.notFound
          ..write('Not Found')
          ..close();
      }
    }
  }

  // Future<void> startServer(Function(ApkModel) onRequest) async {
  //   final server = await HttpServer.bind(InternetAddress.anyIPv4, 5000);
  //   print('Admin server running on ${server.address.address}:${server.port}');

  //   await for (HttpRequest request in server) {
  //     if (request.method == 'POST' && request.uri.path == '/request-apk') {
  //       final processorType = await request.transform(utf8.decoder).join();
  //       final apkRequest = ApkModel(
  //         processorType: processorType,
  //         timestamp: DateTime.now(),
  //       );

  //       final apkUrl = onRequest(apkRequest);
  //       request.response
  //         ..write(jsonEncode({'apkUrl': apkUrl}))
  //         ..close();
  //     } else {
  //       request.response
  //         ..statusCode = HttpStatus.notFound
  //         ..write('Not Found')
  //         ..close();
  //     }
  //   }
  // }

  String getApkUrlForProcessor(String processorType) {
    // Mock data for APK URLs based on processor type
    final apkUrls = {
      "arm64": "http://example.com/apk/arm64.apk",
      "x86": "http://example.com/apk/x86.apk",
    };
    return apkUrls[processorType] ?? "http://example.com/apk/default.apk";
  }
}
