package com.example.wifi_app

import android.content.Intent
import android.net.Uri
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File // أضفنا الاستيراد دا

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.wifi_app/install"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "installApk") {
                val filePath = call.arguments as String
                installApk(filePath)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun installApk(filePath: String) {
        val intent = Intent(Intent.ACTION_VIEW)
        val file = File(filePath) // هنا الكلاس File هيشتغل بشكل صحيح
        val uri = FileProvider.getUriForFile(this, "${applicationContext.packageName}.fileprovider", file)
        intent.setDataAndType(uri, "application/vnd.android.package-archive")
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
        startActivity(intent)
    }
}