package com.example.flutter_app.plugins;

import android.os.Build;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class TextViewPlatformPlugin implements MethodChannel.MethodCallHandler {

    public static final String PLUGIN_NAME = "plugins.mvcoder.com/platformtextview";
    public static final String CHANNEL_NAME = "text_view_plugin";

    public static void registerWith(PluginRegistry.Registrar registrar){
        MethodChannel methodChannel = new MethodChannel(registrar.messenger(),CHANNEL_NAME);
        methodChannel.setMethodCallHandler(new TextViewPlatformPlugin());
        registrar.platformViewRegistry().registerViewFactory(PLUGIN_NAME, new TextViewPlatformViewFactory(registrar.messenger()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if("getPlatformVersion".equals(methodCall.method)){
            result.success("Android version:" + Build.VERSION.RELEASE);
        }else {
            result.notImplemented();
        }
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = TextViewPlatformPlugin.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}
