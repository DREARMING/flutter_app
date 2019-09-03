void main(){

  testMethod();
}


void testMethod(){

  method1("test");
  method2();
  method2(age : 10);

  method3("mvcoder");
  method3("mvcoder", 4);

  //带一个参数的匿名函数 (item){}
  method4((item)=>print(item));

  //所有函数没声明为 void 的，都会有返回值，如果函数
  assert(method5() == null);
}


//方法,不支持函数重载，函数名字不能相同, 单行表达式的函数可以用 =>
void method1(String s) => print("method 1 $s");

//命名参数函数: 参数全是可选值, 如果要传参，必须带上参数名，如 name: mvcoder
void method2({String name = "mvcoder", int age}){
  print("method 2 $name : $age");
}

//带可选参数的函数，age可以不传，也可以设定默认值
void method3(String name, [int age = -1]){
  print("method 3 $name : $age");
}

void method4(var fun){
  var list = [1,2,3];
  fun(list);
}

method5(){}