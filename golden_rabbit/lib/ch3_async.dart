/* 1. Future
// 미래에 받을 String 값
// Future<String> name;
// // 미래에 받을 int값
// Future<int> number;
// // 미래에 받을 boolean값
// Future<bool> isOpened;

void main(){
    addNumbers(1, 1);
}

void addNumbers(int number1, int number2){
    print('$number1 + $number2 계산시작!');

    // Future.delayed()를 사용하면 일정 시간 후에 콜백 함수 실행 가능
    Future.delayed(Duration(seconds: 3), (){
        print('$number1 + $number2 = ${number1 + number2}');
    });

    print('$number1 + $number2 코드 실행 끝!');
}

*/

/* 2. async await 

// void main(){
//     addNumbers(1, 1);
// }


// async 키워드는 함수 매개변수 정의와 바디 사이에 입력
Future<void> addNumbers(int number1, int number2) async {
    print('$number1 + $number2 계산 시작!');

    // await은 대기하고 싶은 비동기 함수 앞에 입력
    await Future.delayed(Duration(seconds: 3), () {
        print('$number1 + $number2 = ${number1 + number2}');
    });

    print('$number1 + $number2 코드 실행 끝');
}
// void main() {
//     addNumbers(1, 1);
//     addNumbers(2, 2);
// }
void main() async {
    await addNumbers(1, 1);
    await addNumbers(2, 2);
}
*/

/* 3. 결과값 반환받기

void main() async {
    final result1 = await addNumbers(1, 1);
    print('결과값 $result1'); // 일반 함수와 동일하게 반환값을 받을 수 있음
    final result2 = await addNumbers(2, 2);
    print('결과값 $result2');
}

Future<int> addNumbers(int number1, int number2) async {
    print('$number1 + $number2 계산 시작!');

    await Future.delayed(Duration(seconds: 3), () {
        print('$number1 + $number2 = ${number1+ number2}');
    });

    print('$number1 + $number2 코드 실행 끝');

    return number1 + number2;
}
 */

/* 4. Stream 
// 지속적으로 값을 반환받을 때 Stream 사용
import 'dart:async';

void main(){
    final controller = StreamController();
    final stream = controller.stream; // Stream 가져오기 

    // Stream에 listen()함수를 실행하면 값이 주입될 때마다 콜백함수를 실행할 수 있음
    final streamListener1 = stream.listen((val) {
        print(val);
    });

    // Stream에 값을 주입할 때는 sink.add() 함수를 실행
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
    controller.sink.add(4);
}

*/

/* 5. Broadcast Stream
- Stream은 단 한번만 listen() 실행 가능
- 여러번 listen()함수를 실행하고 싶을 때 Broadcast Stream 사용


import 'dart:async';

void main(){
    final controller = StreamController();

    // 여러 번 리슨할 수 있는 Broadcast Stream 객체 생성
    final stream = controller.stream.asBroadcastStream();

    // 첫 listen() 함수 
    final streamListener1 = stream.listen((val) {
        print('listening 1');
        print(val);
    });

    final streamListener2 = stream.listen((val) {
        print('listening 2');
        print(val);
    });
    // add()를 실행할 때마다 listen()하는 모든 콜백함수에 값이 주입됨
    controller.sink.add(1);
    controller.sink.add(2);
    controller.sink.add(3);
}
*/

/* 6. 함수로 Stream 변환하기 */

import 'dart:async';


// Stream을 반환하는 함수는 async* 로 선언
Stream<String> calculate(int number) async* {
    for (int i=0; i < 5; i++){
        // StreamController의 add()처럼 yield 키워드를 이용해서 값 반환
        yield 'i = $i';
        await Future.delayed(Duration(seconds: 1));
    }
}

void playStream(){
    // StreamController와 마찬가지로 listen() 함수로 콜백 함수 입력
    calculate(2).listen((val) {
        print(val);
    });
}

void main() {
    playStream();
}