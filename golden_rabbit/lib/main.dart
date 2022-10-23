void main(){
  /* add 함수
    List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

    print(blackPinkList);
    print(blackPinkList[0]);
    print(blackPinkList[3]);

    print(blackPinkList.length);

    blackPinkList[3] = '테스트';
    print(blackPinkList);

    blackPinkList.add('테슷흐');
    print(blackPinkList);
  */

  /* 2. WHERE 함수
    List<String> blackPinkList = ['리사', '지수', '제니', '로제'];
    final newList = blackPinkList.where(
      (name) => name == '리사' || name == '지수',
    );

    print(newList);
    print(newList.toList());
  */

  /* 3. Map 함수
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final newBlackPink = blackPinkList.map(
    (name) => '블랙핑크 $name',
  );
  print(newBlackPink);
  print(newBlackPink.toList());
  */

  /* 4. reduce 함수
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final allMembers = blackPinkList.reduce((value, element) => 
    value + ', ' + element  
  );

  print(allMembers);

  */

  /* 6. fold 함수
  List<String> blackPinkList = ['리사', '지수', '제니', '로제'];

  final allMembers = blackPinkList.fold<int>(0, (value, element) => value + element.length);
  print(allMembers);

  */

  /* 7. Map 타입
  Map<String, String> dictionary = {
    'Harry Potter' : '해리포터',
    'Ron Weasley': '론 위즐리',
    'Hermione Granger' : '헤르미온느',
  };

  print(dictionary['Harry Potter']);
  print(dictionary['Hermione Granger']);

  */
}

  
  