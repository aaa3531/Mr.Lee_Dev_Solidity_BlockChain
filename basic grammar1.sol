// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다

// 기본문법1 (변수,자료형, 연산자)

/*
## 데이터 저장 위치

보통의 프로그래밍 언어라면 변수는 스택, 힙 등 `메모리`에 저장되는 것이 기본입니다.

하지만 솔리디티는 변수를 `메모리`뿐 아닌 하드 디스크 등과 같은 `스토리지`에 저장하기도 합니다.

또한 `calldata` 라는 영역에 저장하기도 하는데, 여기에는 함수 인자가 저장됩니다.

`calldata` 역시 메모리처럼 동작하지만 수정 불가능하고 비영구적인 영역입니다.

**솔리디티의 데이터 저장 위치**

- 메모리
- 스토리지
- calldata

**강제 데이터 위치:**

- 외부 함수의 매개 변수(반환 값 미포함): calldata
- 상태 변수: 스토리지

**기본 데이터 위치:**

- 함수의 매개변수(반환 값 포함): 메모리
- 모든 지역 변수: 스토리지

{데이터타입} {변수명}; // 변수명으로 선언
{데이터타입} {변수명} = {초기화할 값};  // 선언 및 초기화

*/

//  상태변수

pragma solidity ^0.8.14;

contract SimpleStorage {
    uint storedData; // 상태변수 선언
    uint storedData2 = 20; // 상태변수 선언 및 초기화
}


/*
### 상태 변수 접근 수준

컨트랙트 내의 상태(state) 변수를 선언할 때는 지정할 수 있는 접근 수준을 함께 표기합니다.

접근 수준은 public, internal, private, constant / immutable, 네 가지로 나뉩니다.

- `internal`(default):
    - 상태 변수에 기본적으로 사용
    - 컨트랙트 및 해당 컨트랙트를 상속받은 컨트랙트만 접근 가능
    - 외부에서 액세스 불가능
- `public`:
    - 컴파일러가 자동으로 getter 함수를 생성해줌
    - 컨트랙트 내에서 직접 퍼블릭 상태 변수를 사용 가능
    - 외부 컨트랙트나 클라이언트 코드에서도 getter 함수를 통해 퍼블릭 상태 변수에 접근 가능
- `private`:
    - 동일한 컨트랙트 멤버만 프라이빗 상태 변수에 접근 가능
- `constant / immutable`:
    - 선언될 때 값을 할당해야 함
    - 상수화 = 변경 불가능
*/

//  지역변수

pragma solidity ^0.8.14;

contract SimpleStorage {
    ...
		function simpleFunction() public pure returns(uint) {
	    uint a; //  지역변수 선언
			uint b = 1; // 지역변수 선언 및 초기화
			a = 1;
			uint result = a + b;
			return result;
		}
}

//  전역변수

function f(uint start, uint daysAfter) public {
    if (block.timestamp >= start + daysAfter * 1 days) {
      // 여기서 block.timestamp는 전역변수
    }
}

/*

- **block**: 블록에 대한 정보를 가지고 있습니다.
- **msg**: 컨트랙트를 시작한 트랜잭션 콜이나 메시지 콜에 대한 정보를 가지고 있습니다.
- **tx**: 트랜잭션 데이터를 가지고 있습니다.
- **This**: 현재 컨트랙트를 참조합니다. 현재 컨트랙트 주소로 암시적으로 변환됩니다.

*/


// 불 (bool)

bool isOpen = true;
bool isSold = false;


// 정수 (int, unit)

int8 seoulTemp = -20
uint16 myAge = 30

/*
부호(+, -)가 있는 경우에는 int, 부호가 없는 0 이상의 값에는 uint를 사용합니다.
int, uint 뒤에 8 ~ 256의 8의 배수의 숫자를 붙여 변수의 크기를 비트 단위로 지정할 수도 있습니다.
(예. int8, int16, int24, uint64, uint128, …)
각 숫자에 따라 정수는 특정 범위로 제한됩니다.
int16는 -32768~32767 사이의 정수를 의미하며, uint16은 0~65535 사이의 정수를 의미합니다.
일반적으로 뒤에 숫자가 없는 int, utint는 int256, uint256을 의미합니다.
*/

// 주소

address yourAddress = 0x10abb5efEcdc01234f7b2384912398798E089Ab2;

/*
주소 타입은 크게 두 가지 유형으로 나뉩니다.
- **address:** 20바이트의 이더리움 주소 값을 가짐
- **address payable:** address와 동일한 값을 가지지만 추가 멤버인 transfer, send를 가짐
주소(address) 객체는 0x로 시작하고 최대 40자리의 16진수로 구성되는 문자열을 값으로 가집니다.
*/

address addr1;

address payable p_addr1 = payable(addr1);

/*
uint160 또는 bytes20 형식의 데이터를 address payable로 바꾸기 위해서는 먼저 address()를 사용하여 주소 형태로 만들고, 다시 payable()을 사용해 address payable 형식으로 바꿀 수 있습니다.
*/

uint160 num;

address addr = address(num);

address payable p_addr = payable(addr);

/*
컨트랙트를 `address payable`로 변환할 수도 있습니다.
만약 컨트랙트가 이더를 받을 수 있는 컨트랙트인 경우,
`address(컨트랙트)`를 수행했을 때 `address payable` 형식의 주소값을 반환합니다.
*/

contract C  {  // 이더를 받을 수 있는 컨트랙트
	constructor () payable { }
}

address payable addr = address(C);  // address(C)는 adress payable 형식의 주소값을 반환한다


/*
반면, 컨트랙트가 이더를 받지 않는 컨트랙트인 경우,
`address(컨트랙트)`를 수행했을 때 `address` 형식의 주소값을 반환합니다.
이 경우 결과값을 `payable()`에 넣어 `address payable` 형식으로 만들 수 있습니다.
*/

contract D {. // 이더를 받지 않는 컨트랙트
	 constructor () { }
}

address addr = address(D); // address(D)는 adress 형식의 주소값을 반환한다
address payable addr_p = payable(addr); // payable()을 사용해 address payable 형식의 주소값을 만들 수 있다.

// 바이트 배열

/*
데이터를 바이너리 형태로 저장하기 위해 사용합니다.
bytes1 ~ bytes32까지의 고정된 크기의 배열을 선언합니다.
정해진 바이트 크기와 값의 크기가 다르면 에러가 납니다.
*/

bytes3 alphabets = 'abc';

alphabets[0] // 'a'
alphabets[1] // 'b'
alphabets[2] // 'c'

// 열거형

enum EvalLevel { Bad, Soso, Great } // 열거형 집합을 지정합니다.
EvalLevel kimblock = EvalLevel.Bad // 열거형으로 변수를 선언합니다.
int16 kimblockValue = int16(kimblock); // kimblock 열거형 값 0을 정수형으로 변환합니다.


