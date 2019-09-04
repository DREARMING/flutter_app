import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/plugins/SystemInfoPlugin.dart';

class NavigationTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _NavigationState();
  }
}

class _NavigationState extends State<NavigationTest> {
  List bottomTitles = ['home', 'business', 'school'];
  int _selectIndex = 0;

  void _onTapBottomIndex(int index) {
    Fluttertoast.showToast(msg: 'touch index : $index');
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Navigation Test"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share, color: Colors.white),
              onPressed: () {
                //调用Android api
                SystemInfoPlugin.getBatteryLevel()
                .then((battery){
                  Fluttertoast.showToast(msg: 'battery: $battery');
                }).catchError((e){
                  Fluttertoast.showToast(msg: 'error! method not impl');
                });
                //Fluttertoast.showToast(msg: 'shared content');
              })
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 200,
              child: Stack(
                children: <Widget>[
                  ClipOval(child: Image.asset('images/ic_launcher.png'))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(bottomTitles[0])),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text(bottomTitles[1])),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text(bottomTitles[2])),
        ],
        currentIndex: _selectIndex,
        fixedColor: Colors.blue,
        onTap: _onTapBottomIndex,
      ),
    );
  }
}
