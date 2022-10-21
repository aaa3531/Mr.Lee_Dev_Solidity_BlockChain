// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다

// 참조형 데이터 타입


/*
참조형 변수(reference type)는 마치 배열과 같이, 연속되어 저장되는 값의 첫번째 메모리의 **주소**를 값으로 가지는 변수 타입입니다. 이를 '**참조한다'**라고 표현합니다.

데이터 저장 영역에는 세 종류가 있다고 위에서 다룬 적이 있습니다.

- **메모리**: 프로그램이 동작하는 동안에만 값을 기억하고, 종료되면 값을 잃는 데이터 영역
- **스토리지**: 블록체인에 기록되어 영구적으로 값이 유지되는 데이터 영역
- **calldata:** 메모리와 비슷하지만 수정 불가능하고 비영구적인 데이터 영역

참조형 변수를 선언할 때는 `메모리`에 저장할지 `스토리지`에 저장할지 명시해야 합니다.

(상태변수는 무조건 스토리지에 저장됩니다.)
*/

function f() {
	 // 5개의 int32 형태의 데이터를 메모리에 저장하는 변수 fixedSlots 선언
	int32[5] memory fixedSlots;
	fixedSlots[0] = 13;
}

/*
참조형 변수의 유형은 다음과 같습니다.

- 배열(Array)
- 바이트 배열(가변 크기, Dynamically-sized byte array)
- 문자열(String)
- 구조체(Struct)
- 매핑(Mapping)
*/

bytes alphabets = 'abc'; // 바이트 배열

string name = 'kimblock'; // 문자열

// 구조체

contract exmapleC {
	struct User {
	    address account;
	    string lastName;
	    string firstName;
			mapping (uint => Funder) funders;
	}

	mapping (uint => User) users;
}

contract exmapleC {

	struct User {
	    address account;
	    string lastName;
	    string firstName;
	}

	function newUser (address newAddress, string newLastName, string newFirstName){
	    User memory newOne = User({account: newAddress, lastName: newLastName, firstName: newFirstName});
	}
}

// 매핑

/*
매핑(mapping)은 스토리지 데이터 영역에서 `키-값` 구조로 데이터를 저장할 때 사용하는 참조형입니다.
`mapping({키 형식}=> {값 형식}) {변수명}` 형태로 선언합니다.
여기서 `키 형식`은 매핑, 구조체, 배열 제외한 유형의 값이 다 될 수 있습니다.
여기서 `값 형식`은 매핑, 구조체, 배열을 포함한 모든 유형의 값이 다 될 수 있습니다.
매핑은 일반적인 프로그래밍 언어에서의 해시 테이블 또는 딕셔너리(자바스크립트는 객체)와 유사합니다.

키 자체가 실제로 저장되지는 않고, 키의 keccak256 해시를 이용해 값에 접근합니다.

매핑은 오직 `스토리지` 영역에만 저장될 수 있으므로 상태 변수, 내부 함수에서의 스토리지 참조 타입, 라이브러리 함수의 매개 변수에만 허용됩니다.
*/



// 산술연산자

/*
매핑은 일반적인 프로그래밍 언어에서의 해시 테이블 또는 딕셔너리(자바스크립트는 객체)와 유사합니다.
키 자체가 실제로 저장되지는 않고, 키의 keccak256 해시를 이용해 값에 접근합니다.
매핑은 오직 `스토리지` 영역에만 저장될 수 있으므로 상태 변수, 내부 함수에서의 스토리지 참조 타입, 라이브러리 함수의 매개 변수에만 허용됩니다.

+
두 개의 피연산자를 더하는 데 사용합니다.
-
첫 번째 피연산자에서 두 번째 피연산자를 빼는 데 사용합니다.
*
두 개의 피연산자를 곱하는 데 사용합니다.
/
첫 번째 피연산자(분자)를 두 번째 피연산자(분모)로 나누는 데 사용합니다.
%
첫 번째 피연산자를 두 번째 피연산자로 나눈 나머지를 제공합니다.
++
정수 값을 1씩 증가시킵니다.
—
정수 값을 1씩 감소시킵니다.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
// 컨트랙트 생성
contract SolidityTest {

     // 변수 선언 및 초기화
    uint16 public a = 20;
    uint16 public b = 10;

    // + 연산자를 활용한 덧셈 및 초기화
		// sum == 30
    uint public sum = a + b;

    // - 연산자를 활용한 뺄셈 및 초기화
		// diff == 10
    uint public diff = a - b;

    // * 연산자를 활용한 곱셈 및 초기화
		// mul == 200
    uint public mul = a * b;

    // / 연산자를 활용한 나눗셈 및 초기화
    // div == 2
    uint public div = a / b;

    // % 연산자를 활용한 나머지 계산 및 초기화
    // mod == 0
    uint public mod = a % b;

    // ++ 연산자를 활용한 1 증가
    // inc == 21
    uint public inc = ++a;

    // -- 연산자를 활용한 1 감소
    // dec == 9
    uint public dec = --b;

}

// 비교연산자

/*
==
두 값이 같은지 여부를 확인합니다.
같으면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
!=
두 값이 같지 않은지 여부를 확인합니다.
같지 않으면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
>
왼쪽 값이 오른쪽값보다 큰지 여부를 확인합니다.
더 크다면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
<
왼쪽 값이 오른쪽값보다 작은지 여부를 확인합니다.
더 작다면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
>=
왼쪽 값이 오른 값보다 크거나 같은지 여부를 확인합니다.
더 크거나 같다면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
<=
왼쪽 값이 오른쪽값보다 작거나 같은지 여부를 확인합니다.
더 작거나 같다면 true를 반환하고, 그렇지 않으면 false를 반환합니다.
*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
// 컨트랙트 생성
contract SolidityTest {

    // 변수 선언 및 초기화
    uint16 public a = 20;
    uint16 public b = 10;

    // == 연산자를 활용한 비교 및 초기화
    // eq == false
    bool public eq = a == b;

    // != 연산자를 활용한 비교 및 초기화
    // noteq == true
    bool public noteq = a != b;

    // > 연산자를 활용한 비교 및 초기화
    // gtr == true
    bool public gtr = a > b;

    // < 연산자를 활용한 비교 및 초기화
    // les == false
    bool public les = a < b;

    // >= 연산자를 활용한 비교 및 초기화
    // gtreq == true
    bool public gtreq = a >= b;

    // <= 연산자를 활용한 비교 및 초기화
    // leseq == false
    bool public leseq = a <= b;

}

// 논리 연산자

/*
| 연산자 | 의미 |
| --- | --- |
| && | 두 조건이 모두 참인지 여부를 확인합니다.
모두 참이면 true를 반환하고, 하나 또는 둘 다 거짓이면 false를 반환합니다. |
| || | 최소 하나의 조건이 참인지 여부를 확인합니다.
하나 또는 두 조건이 참이면 true를 반환하고, 둘 다 거짓이면 false를 반환합니다. |
| ! | true를 false로, false를 true로 반전합니다. |
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
// 컨트랙트 생성
contract SolidityTest {

		// 변수 선언 및 초기화
    bool public a = true;
    bool public b = false;

    // && 연산자를 활용한 조건 결합 및 초기화
		// and == false
    bool public and = a && b;

    // || 연산자를 활용한 조건 결합 및 초기화
		// or == true
    bool public or = a || b;

    // ! 연산자를 활용한 조건 반전 및 초기화
		// not == false
    bool public not = !a;

}

// 할당 연산자

/*
=
오른쪽에 있는 피연산자를 왼쪽에 있는 피연산자에 할당합니다.
+=
오른쪽의 피연산자를 왼쪽의 피연산자에 더하고 그 값을 할당합니다.
-=
왼쪽 피연산자에서 오른쪽 피연산자를 빼고 그 값을 할당합니다.
*=
피연산자를 모두 곱하고 그 값을 할당합니다.
/=
왼쪽의 피연산자를 오른쪽 피연산자로 나누고 그 값을 할당합니다.
%=
왼쪽의 피연산자를 오른쪽 피연산자로 나눈 나머지 값을 할당합니다.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
// 컨트랙트 생성
contract SolidityTest {

    // 변수 선언 및 초기화
    uint16 public assignment = 20;
    uint public assignment_add = 50;
    uint public assign_sub = 50;
    uint public assign_mul = 10;
    uint public assign_div = 50;
    uint public assign_mod = 32;

    function getResult() public{
       assignment_add += 10; // += 연산자 사용. 60
       assign_sub -= 20; // -= 연산자 사용. 30
       assign_mul *= 10; // *= 연산자 사용. 100
       assign_div /= 10; // /= 연산자 사용. 5
       assign_mod %= 20; // %= 연산자 사용. 12
       return ;
    }
}

// 비트 연산자

/*
&
정수의 각 비트에 대해 부울 AND 연산을 수행합니다.
|
정수의 각 비트에 대해 부울 OR 연산을 수행합니다.
^
정수의 각 비트에 대해 부울 배타적 OR 연산을 수행합니다.
~
정수의 각 비트에 대해 부울 NOT 연산을 수행합니다.
<<
왼쪽 피연산자의 모든 비트를 오른쪽 피연산자에 의해 지정된 위치 수만큼 왼쪽으로 이동합니다.
>>
왼쪽 피연산자의 모든 비트를 오른쪽 피연산자에 의해 지정된 위치 수만큼 오른쪽으로 이동합니다.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// 컨트랙트 생성
contract SolidityTest {

    // 변수 선언 및 초기화
    uint16 public a = 20;
    uint16 public b = 10;
		// a는 10100
		// b는 01010

    // &를 활용한 비트 AND 연산 및 초기화
    // and == 0
    uint16 public and = a & b;

    // |를 활용한 비트 OR 연산 및 초기화
    // or === 30
    uint16 public or = a | b;

    // ^를 활용한 비트 ㅐ탖OR 연산 및 초기화
    // or === 30
    uint16 public xor = a ^ b;

    // Initializing a variable
    // to '<<' value
    uint16 public leftshift = a << b;

    // Initializing a variable
    // to '>>' value
    uint16 public rightshift = a >> b;

    // Initializing a variable
    // to '~' value
    uint16 public not = ~a ;

}

// 조건부 연산자

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;
// 컨트랙트 생성
contract SolidityTest{

     function sub(
       uint a, uint b) public view returns(
       uint){
      uint result = (a > b? a-b : b-a);
      return result;
 }
}

/*
만약 a의 값이 2, b의 값이 1 이라면 a > b가 true가 되어 a-b의 값을 반환합니다.
만약 a의 값이 1, b의 값이 1 이라면 a > b가 false가 되어 b-a의 값을 반환합니다.
만약 a의 값이 1, b의 값이 2 이라면 a > b가 false가 되어 b-a의 값을 반환합니다.
*/