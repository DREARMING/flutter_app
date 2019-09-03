import 'Person.dart';

void main() {
  //使用new语句来构造一个类，构造函数的名字可能是ClassName，也可以是ClassName.identifier， 例如：
  var person = new Person("mvcoder", 20, 2); //默认构造函数
  print(person);
  Map map = new Map();
  map['name'] = 'mvp';
  map['age'] = 18;
  map['apple'] = 10;

  //ClassName.identifier 类型的构造函数
  var person1 = new Person.fromJson(map);
  print(person1);

  //访问属性
  print(person.name);

  Person temp;
  //判空操作符，避免空指针
  print(temp?.name);

  //打印类的类名
  print(person.runtimeType);

  person.saySomething();

  //person._saySecret(); 私有方法不可访问。  _都是私有的意思，可以用来定义变量和方法

  var student = new Student(map);

  //类型判断，跟 instantsOf 类似
  if (student is Person) {
    print("student is a person");
  }

  //具有常量构造函数的类，类的所有东西都不能改变。全都是编译器常量。
  var constClass = new ConstClass("mvcoder");
  print("常量构造函数 ： ${constClass.name}");



}
