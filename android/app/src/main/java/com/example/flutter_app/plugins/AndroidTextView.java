package com.example.flutter_app.plugins;

import android.content.Context;
import android.view.View;
import android.widget.TextView;

import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.platform.PlatformView;

public class AndroidTextView  implements PlatformView {

    private TextView mTextView;

    public AndroidTextView(Context context, BinaryMessenger messenger, int id, Map<String,Object> params){
       mTextView = new TextView(context);
       if(params != null && params.get("text") != null){
           String text = (String) params.get("text");
           mTextView.setText(text);
       }else{
           mTextView.setText("I am a android TextView");
       }
    }

    @Override
    public View getView() {
        return mTextView;
    }

    @Override
    public void dispose() {
        mTextView = null;
    }
}
