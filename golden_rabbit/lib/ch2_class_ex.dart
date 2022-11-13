/* 1. 메서드
class Idol {
    String name = '블랙핑크';

    // 1. 메서드
    void sayName(){
        print('저는 ${this.name}입니다.');
        print('저는 $name입니다.');
    }
}
*/

/* 2. 생성자 (contsructor) 
class Idol {

    // 생성자에서 입력받는 변수들은 일반적으로 final 키워드 사용
    // -> 인스턴스화한 다음에 혹시라도 변수의 값을 변경하는 실수를 막기 위함
    final String name;
    // 생성자 선언
    // 클래스와 같은 이름이어야 함.
    // 함수의 매개변수를 선언하는 것처럼 매개변수를 지정
    Idol(String name) : this.name = name;

    void sayName(){
        print('저는 ${this.name}입니다.');
    }
}
*/

/* 3. 네임드 생성자 
class Idol {
    final String name;
    final int membersCount;

    // 생성자
    Idol(String name, int membersCount)
    // 1개 이상의 변수를 저장하고 싶을 때는, 기호로 연결해주면 됨
        : this.name =  name,
          this.membersCount = membersCount;
    
    // 네임드 생성자 
    // {클래스명.네임드 생성자명} 형식
    // 나머지 과정은 기본 생성자와 같음 
    Idol.fromMap(Map<String, dynamic> map)
        : this.name = map['name'],
          this.membersCount = map['membersCount'];

    void sayName(){
        print('저는 ${this.name}입니다. ${this.name} 멤버는 ${this.membersCount}명입니다.');
    }
}


void main(){

    // 기본생성자 사용
    Idol blackPink = Idol('블랙핑크', 4);
    blackPink.sayName();

    // fromMap이라는 네임드 생성자 사용 
    Idol bts = Idol.fromMap({
        'name' : 'BTS',
        'membersCount' : 7,
    });
    bts.sayName();
}
*/

/* 4. 프라이빗 변수

class Idol {
    // '_'로 변수명을 시작하면 프라이빗 변수 선언 가능
    String _name;
    Idol(this._name);
}

void main(){
    Idol blackPink = Idol('블랙핑크');
    
    // 같은 파일에서는 _name 변수에 접근할 수 있지만
    // 다른 파일에서는 _name 변수에 접근할 수 없음
    print(blackPink._name);
} 
*/

/* 5. getter / setter
-  요즘 객체지향에서는 변수의 값을 Immutable(인스턴스화 후 변경할 수 없는)특성으로 
사용하기 때문에 setter는 거의 사용하지 않고 getter는 가끔 사용 

class Idol {
    String _name = '블랙핑크';

    // get 키워드를 사용해서 getter임을 명시 
    // getter는 매개변수를 전혀 받지 않음
    String get name {
        return this._name;
    }
    // setter는 set키워드를 사용해서 선언
    // 매개변수로 딱 하나의 변수를 받을 수 있음
    set name(String name){
        this._name = name;
    }
}

void main(){
    Idol blackPink = Idol();
    
    // 세터
    blackPink.name = '에이핑크';
    // 게터 
    print(blackPink.name);
}
*/

/* 6. 상속 

class Idol {
    final String name;
    final int membersCount;

    Idol(this.name, this.membersCount);

    void sayName(){
        print('저는 ${this.name}입니다.');
    }

    void sayMembersCount(){
        print('${this.name} 멤버는 ${this.membersCount}명입니다.');
    }   
}

class BoyGroup extends Idol {

    // 상속받은 생성자

    BoyGroup(
        String name,
        int membersCount,
    ) : super (
        name,
        membersCount,
    );

    // 상속받지 않은 기능
    void sayMale() {
        print('저는 남자 아이돌입니다.');
    }

}

void main(){
    BoyGroup bts = BoyGroup('BTS', 7); // 생성자로 객체 생성

    bts.sayName();
    bts.sayMembersCount();
    bts.sayMale();
}

*/

/* 7. 오버라이드 

class Idol {
    final String name;
    final int membersCount;

    Idol(this.name, this.membersCount);

    void sayName(){
        print('저는 ${this.name}입니다.');
    }

    void sayMembersCount(){
        print('${this.name} 멤버는 ${this.membersCount}명입니다.');
    }   
}

class GirlGroup extends Idol {
    GirlGroup(
        super.name,
        super.membersCount,
    );

    @override 
    void sayName(){
        print('저는 여자 아이돌 ${this.name}입니다.');
    }
}

void main(){
    GirlGroup blackPink = GirlGroup('블랙핑크', 4);

    // 자식 클래스의 오버라이드 된 메서드 사용
    blackPink.sayName();

    // 부모 클래스 메서드
    blackPink.sayMembersCount();
}

*/

/* 8. 믹스인 

- 특정 클래스에 원하는 기능들만 골라넣을 수 있는 기능
class Idol {
    final String name;
    final int membersCount;

    Idol(this.name, this.membersCount);

    void sayName(){
        print('저는 ${this.name}입니다.');
    }

    void sayMembersCount(){
        print('${this.name} 멤버는 ${this.membersCount}명입니다.');
    }   
}

mixin IdolSingMixin on Idol {
    void sing(){
        print('${this.name}이 노래를 부릅니다.');       
    }
}


// 믹스인 적용시 with 키워드 사용
class BoyGroup extends Idol with IdolSingMixin{
    BoyGroup(
        super.name,
        super.membersCount,
    );

    void sayMale(){
        print('저는 남자 아이돌입니다.');
    }
}

void main(){
    BoyGroup bts = BoyGroup('BTS', 7);
    
    bts.sing();

} 

*/

/* 9. 추상 
- 상속이나 인터페이스로 필요한 속성만 정의하고 인스턴스화 할 수 없도록 하는 기능
- 추상 클래스는 추상 메서드를 선언할 수 있음 
- 추상 메서드는 함수의 반환타입, 이름, 매개변수만 정의하고 함수 바디의 선언을 자식 클래스에서 필수로 정의하도록 강제함


abstract class Idol {
    final String name;
    final int membersCount;

    Idol(this.name, this.membersCount); // 생성자 선언

    void sayName(); // 추상 메서드 선언
    void sayMembersCount(); // 추상 메서드 선언
}

class GirlGroup implements Idol {
    final String name;
    final int membersCount;

    GirlGroup(
        this.name,
        this.membersCount,
    );

    void sayName(){
        print('저는 여자 아이돌 ${this.name}입니다.');
    }

    void sayMembersCount(){
        print('${this.name} 멤버는 ${this.membersCount}명입니다.');
    }
}

void main(){
    GirlGroup blackPink = GirlGroup('블랙핑크', 4);

    blackPink.sayName();
    blackPink.sayMembersCount();

}

*/ 

/* 10. 제네릭 
- 클래스나 함수의 정의를 선언할 때가 아니라 인스턴스화하거나 실행할 때로 미룸
- 특정 변수의 타입을 하나의 타입으로 제한하고 싶지 않을 때 자주 사용

class Cache<T> {

    // data의 타입을 추후 입력될 T 타입으로 지정
    final T data;

    Cache({
        required this.data,
    });
}

void main(){
    // T의 타입을 List<int>로 입력합니다.
    final cache = Cache<List<int>>(
        data: [1, 2, 3],
    );
    print(cache.data.reduce((value, element) => value + element));
}
*/

/* 11. 스태틱
- static 키워드 사용시 클래스 자체에 변수와 메서드가 귀속됨


class Counter{
    static int i = 0;

    Counter(){
        i++;
        print(i++);
    }
}

void main(){
    Counter count1 = Counter();
    Counter count2 = Counter();
    Counter count3 = Counter();   
}
*/


/* 12. 캐스케이드 연산자 

- 인스턴스에서 해당 인스턴스의 속성이나 멤버 함수를 연속해서 사용하는 기능

class Idol {
    final String name;
    final int membersCount;

    Idol(this.name, this.membersCount);

    void sayName(){
        print('저는 ${this.name}입니다.');
    }

    void sayMembersCount(){
        print('${this.name} 멤버는 ${this.membersCount}명입니다.');
    }   
}
void main(){
    Idol blackPink = Idol('블랙핑크', 4)
        ..sayName()
        ..sayMembersCount();
}
*/