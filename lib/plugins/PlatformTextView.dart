import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class PlatformTextView extends StatelessWidget{

  static const String PLUGIN_NAME = "plugins.mvcoder.com/platformtextview";

  String text;

  PlatformTextView({String text}){
    this.text = text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 根据运行平台判断执行代码
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        // 在 native 中的唯一标识符，需要与 native 侧的值相同
        viewType: PLUGIN_NAME,
        // 在创建 AndroidView 的同时，可以传递参数
        creationParams: <String, dynamic>{"text": text},
        // 用来编码 creationParams 的形式，可选 [StandardMessageCodec], [JSONMessageCodec], [StringCodec], or [BinaryCodec]
        // 如果存在 creationParams，则该值不能为null
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else/* if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: PLUGIN_NAME,
        creationParams: <String, dynamic>{"text": text},
        creationParamsCodec: const StandardMessageCodec(),
      );
    } else*/ {
      return Text("不支持的平台");
    }
  }
}