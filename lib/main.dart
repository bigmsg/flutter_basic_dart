/*
  dart
  - javascript + java 를 합친 언어



 */
void main() {
  var a = 10;
  var b = 'Hello';
  var c = 3.0;
  var isMarried = true;

  dynamic d = 10; // 어떤 타입도 다 가능
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

}

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


