package com.example.flutter_app.plugins;

import android.content.Context;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class TextViewPlatformViewFactory extends PlatformViewFactory {

    private BinaryMessenger binaryMessenger;

    public TextViewPlatformViewFactory(BinaryMessenger binaryMessenger){
        super(StandardMessageCodec.INSTANCE);
        this.binaryMessenger = binaryMessenger;
    }

    @Override
    public PlatformView create(Context context, int i, Object args) {
        Map<String, Object> params = null;
        if(args instanceof Map) {
            params = (Map<String, Object>) args;
        }
        return new AndroidTextView(context, binaryMessenger, i, params);
    }
}
