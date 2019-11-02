package com.example.flutter_to_native_code

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  val channel = "flutter.native.code/example"

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView, channel).setMethodCallHandler { call, result ->
      if (call.method == "greetingFromNativeCode") {
        val name = call.argument<String>("name") ?: "unknown"
        result.success("Hello $name, from Android code")
      }
    }
  }
}
