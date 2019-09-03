///类是没有 private、protected、 public关键字做访问限制的，私有属性请用 _field, field该属性将会成为私有，类外不能直接访问,该类是内部类除外
class Person {
  String name;
  int age;
  int _apples; //私有属性，不默认生成 getter 和 setter 方法

  //这也是一种构造函数:命名构造函数
  Person.fromJson(Map map) {
    name = map['name'];
    age = map['age'];
    _apples = map['apple'];
  }

  //默认构造函数
  Person(String name, int age, int apples) {
    this.name = name;
    this.age = age;
    this._apples = apples;
  }

  void saySomething() {
    print("hello, my name is $name");
  }

  void _saySecret(){
    print("hello, my age is $age");
  }

  @override
  String toString() {
    // TODO: implement toString
    return '$name is $age, have $_apples apples';
  }
}

class Student extends Person {
  //Person 没有无参构造函数，需要自己实现父类的构造函数
  Student(Map map) : super.fromJson(map) {
    print("student contructor!");
  }

  void saySomething() {
    print("i am a student!");
  }
}

class ConstClass {
  final String name;

  const ConstClass(this.name);

  void _print() {
    print("该方法外部不可见，私有方法");
  }
}
