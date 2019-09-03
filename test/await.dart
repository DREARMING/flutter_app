import 'dart:async';

void main() async{
  print("main function call");

  //该函数被声明为 异步，所以不需要等待，将会执行下一句。
  test();

  print("after execute test method");

  //因为调用了 await， 需要等待 Future 返回才能执行下一句
  print(await getAppVersionName());


  print("main function end");
}


void test() async {
  String username = await getUsername();
  print("test method return : $username");
}

Future<String> getAppVersionName() {
  return new Future.delayed(Duration(seconds: 5), () {
    return 'V1.0.0';
  });
}

Future<String> getUsername(){
  return new Future.delayed(Duration(seconds: 2),(){
    return 'mvcoder';
  });
}