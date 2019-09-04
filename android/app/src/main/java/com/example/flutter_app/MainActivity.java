package com.example.flutter_app;

import android.os.Bundle;

import com.example.flutter_app.plugins.CustomPluginRegistrant;
import com.example.flutter_app.plugins.SystemInfoPlugin;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    initCustomPlugins();
  }

  private void initCustomPlugins() {
    CustomPluginRegistrant.registerWith(this);
    SystemInfoPlugin.registerWith(getFlutterView());
  }
}
