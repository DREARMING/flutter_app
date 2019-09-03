import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TestPage<String> extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _TestPageState();
  }
}

class _TestPageState extends State<StatefulWidget> {

  String _arguments;

  @override
  Widget build(BuildContext context) {
     _arguments = ModalRoute.of(context).settings.arguments as String;

    // TODO: implement build
    //WillPopScope 用来监听物理返回键的
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: new Text('Test Page'),
            centerTitle: true,
            leading: IconButton(icon:const BackButtonIcon(), onPressed: (){
              return Navigator.maybePop<String>(context,"Test page return value");
            }),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.add, color: Colors.white,),
                  onPressed: (){
                      Fluttertoast.showToast(msg: "add bt touch");
                  })
            ],
          ),
          body: Container(
            alignment: AlignmentDirectional.center ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/ic_launcher.png"),
                Text('$_arguments', style: TextStyle(color: Colors.blue, fontSize: 30)),
                Icon(Icons.person, color: Colors.greenAccent)
              ],
            ),
          )
        ),
        onWillPop: () {
          Navigator.pop<String>(context, "Test page return value");
          //不用返回true，因为上面已经pop了，否则会出现问题。
          return Future.value(false);
        });
  }
}
