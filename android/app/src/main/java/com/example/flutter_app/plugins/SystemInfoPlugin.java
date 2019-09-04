package com.example.flutter_app.plugins;

import android.content.Context;

import java.lang.ref.WeakReference;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.view.FlutterView;

public class SystemInfoPlugin implements MethodChannel.MethodCallHandler {

    public static final String SYSTEM_INFO_PLUGIN_CHANNEL = "mvcoder/SystemInfoPlugin";
    static final String METHOD_GET_BATTERY_LEVEL = "getBatteryLevel";

    private WeakReference<Context> contextWeakReference;

    private SystemInfoPlugin(Context context){
        contextWeakReference = new WeakReference<>(context);
    }

    public static void registerWith(FlutterView flutterView){
        MethodChannel methodChannel = new MethodChannel(flutterView, SYSTEM_INFO_PLUGIN_CHANNEL);
        methodChannel.setMethodCallHandler(new SystemInfoPlugin(flutterView.getContext()));
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        String method = methodCall.method;
        switch (method){
            case METHOD_GET_BATTERY_LEVEL:
                result.success(66);
                break;
            default:
                result.notImplemented();
                break;
        }
    }
}
