package com.example.xiecheng_flutter_app

import android.os.Bundle
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import org.devio.flutter.splashscreen.MySplashScreen

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        MySplashScreen.show(this, true)
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
    }
}
