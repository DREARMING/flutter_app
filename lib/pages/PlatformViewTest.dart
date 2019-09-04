import 'package:flutter/material.dart';
import 'package:flutter_app/plugins/PlatformTextView.dart';


class PlatformViewTest extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _PlatformViewState();
  }
}

class _PlatformViewState extends State<PlatformViewTest>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform View'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text('flutter text view 1'),
          Expanded(
            flex: 1,
            child: PlatformTextView(text: 'hi Android TextView 22',),
          ),
          Text('flutter text 2')
        ],
      ),
    );
  }

}