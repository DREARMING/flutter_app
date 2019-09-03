import 'package:flutter/material.dart';

class StackTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _StackTestState();
  }
}

class _StackTestState extends State<StackTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Stack Test'),
        centerTitle: true,
      ),
      //相当于FrameLayout，会层叠子对象，子View可以通过 Align 来实现布局，也可以通过Position
      //Align 和 Position 都是相对于父布局而言，如何进行布局的方式。
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Align(child: Text('Text 1'), alignment: Alignment.center),
          Align(
              //添加 padding
              child:
                  Padding(padding: EdgeInsets.all(10), child: Text('Text 2')),
              alignment: Alignment.topRight),
          SizedBox(
            width:100, height:100,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  'Text 3',
                  textAlign: TextAlign.center,
                ))),
          ),
          Align(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: 100,
              height: 100,
              child: Text('Text 3 container', textAlign: TextAlign.center,),
              alignment: Alignment.center,
              margin: EdgeInsets.all(10), //margin
            ),
            alignment: Alignment.centerRight,
          ),
          Positioned(
            child: Text('Text4'),
            top: 100,
          )
        ],
      ),
    );
  }
}
