
import 'dart:convert';

import 'package:http/http.dart' as http;

/*
  dart
  - javascript + java 를 합친 언어



 */
void main() {
  String aa = "Good morning"; // 문자열타입 지정
  int bb = 10; // 정수타입 지정
  int cc;   // cc --> null

  var a = 10; // var 동적할당 특정 타입을 지정하지 않아도 값에 따라 타입결정됨
  var b = 'Hello';
  var c = 3.0;
  var isMarried = true;

  dynamic d = 10; // 어떤 타입도 다 가능, 함수 인자로 정수, 문자열 구분없이 전달하고 싶을 경우
  num z = 10; // num: int, double 모두 가능


  myPrint(10.0);

  final e = 10; // 동적메모리 할당(대부분 이거 쓰면 됨)
  const f = 20; // 정적메모리 할당

  // 타입체크
  if (a is int) { // is, is! : 타입체크
    print('정수');
  }

  // 타입캐스팅
  var x = a as int;

  // 데이터 선언만 하면 null
  String name;
  print(name ?? '널'); // --> null

  // ? 옵셔널
  print(name?.toLowerCase()); // ?: null이 아닐경우에만 .toLowerCase()실행

  /* 컬렉션 타입
    - 따로 배열이란 건 없고 대신 List사용
    List, Set, Map
   */
  List<String> items = ['a', 'b', 'c'];
  var items2 = ['a', 'b', 2];  // 타입추론
  print(items2);

  var itemSet = {1, 2, 3};
  var itemMap = {
    'key1': 1,
    'key2': 2,
    'key3': 3,
  };
  print(itemMap);

  // 범위 연산자
  var items3 = [...items2, 4, 5];
  print(items3);

  // 함수 arguments  전달방
  something('홍길동', age: 21, height: 175);

  // 클래스
  var person = Person('홍길동', age: 25)..setAge(45);  // new 생략가능, 생성후 바로 메소드 호출하기(..)
  //print(person._name); // 직접접근 못함
  print(person.name);
  print(person.age);


  /* 비동기 처리
      1. Future, async, await
      2. Stream
    Future 결과값이 언제 돌아올지 모르는 것은 모두

    async: 한번 처리하고 끝남
    stream: 상태를 계속 주시하고 있음
    -
   */

  print('network 시작');
  networkRequest();
  print('network 끝');


  // 주석사용법

  var write = 1020;

  var zz = write;

  getData();
}


void getData() async {
  var response = await http.get('https://api.airvisual.com/v2/nearest_city?key=0607de95-cede-43b1-bf2f-8101f52cacfe');
  print(response);
  print(json.decode(response.body));
}


/// 이 주석은 객체 도움말에 표시되는 주석임
/// 작성: 2020.02.11(수)
myPrint(num str) {
  print('$str');
}

/*
parameter 선언방법
필수:
옵션: {} --> 함수호출시 옵션 argument, argument명은 필수,
 */
void something(String name, {int age, int height = 175}) { // {} 옵션인자임: key가 필수임
  print('$name $age');

}




// 클래스
class Person {
  String _name;   // '_'가 붙으면 private 이 됨, 외부에서 직접접근 못함
  int age;

  Person(this._name, {this.age});

  // Getter 정의
  String get name => '제 이름은: ${_name}'; // () {}  --> '=>' 으로 변환 가
  /* // 축약되지 않은 원래 Getter 모습
  String get name {
    return '제 이름은: ${_name}';
  }*/


/* Person(String name, int age) {
      this.name = name;
      this.age = age;
  }*/

  void setName(String name) {
    this._name = name;
  }
  void setAge(int age) {
    this.age = age;
  }


}




/*
  dart 에서는 interface 문법이 없음
  implements: 부모클래스의 모든 멤버를 override 해야 함
  with: 원하는 멤버만 override 할 수 있
 */
class Employee implements Person {
//class Employee with Person {
  @override
  String _name;

  @override
  int age;

  Employee(this._name, {this.age});

  @override
  String get name => null;

  @override
  void setAge(int age) {
  }

  @override
  void setName(String name) {
  }

}


/*
비동기 함수

 */


Future networkRequest() async {
  print('네트워크 요청시작');
  Future.delayed(Duration(seconds: 1), () => print('hello'));
  print('1');
  Future.delayed(Duration(seconds: 1));
  print('2');
  Future.delayed(Duration(seconds: 1));
  print('3');
  print('네트워크 요청끝');
}