// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다

// 기본문법 4 (조건문, 반복문)

/*

if(조건식 A) {
     조건식 A가 참인 경우 여기 있는 코드 수행
}

if(조건식 A) {
     조건식 A가 참인 경우 여기 있는 코드 수행
}
else {
     조건식 A가 거짓인 경우 여기 있는 코드 수행
}

if(조건식 A) {
     조건식 A가 참인 경우 여기있는 코드 수행
}
else if(조건식 B) {
     조건식 A가 거짓이고, 조건식 B가 참인 경우 여기있는 코드 수행
}
else {
     조건식이 모두 거짓인 경우 여기있는 코드 수행
}

| 조건식 | 의미 |
| --- | --- |
| a > b | a가 b보다 크면 참, 작으면 거짓 |
| a >= b | a가 b와 같거나 b보다 크면 참, 작으면 거짓 |
| a < b | a가 b보다 작으면 참, 크면 거짓 |
| a <= b | a가 b와 같거나 b보다 작으면 참, 크면 거짓 |
| a > 10 && a< 20 | a가 10보다 크고 20보다 작으면 참(10과 20 사이에 있으면 참) |
| a < 10 ll a > 20 | a가 10보다 작거나 20보다 크면 참(10과 20 사이에 있으면 거짓) |
| true | 무조건 참 |
| false | 무조건 거짓 |

*/

function checkCondition(uint x) public pure returns(uint result){
	// result = 조건식 ? 참일 경우 : 거짓일 경우;
	result = x >= 1500 ? 1 : 0;
	return result
}

//  반복문

while (조건식) {
    조건식이 참이면 여기 있는 코드 수행
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract WhileLoop {
    uint[] data;
    uint8 j = 0;

    function loop(
    ) public returns(uint[] memory){
    while(j < 5) {
        j++;
        data.push(j);
     }
      return data;
    }
}

// data == [1, 2, 3, 4, 5]

//  do-while문

do
{
	최초 한번은 무조건 실행
	이후부터는 조건식이 참이면 여기 있는 코드 수행
} while (조건식);

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract DoWhileLoop {
    uint[] data;
    uint8 j = 0;

    function loop(
    ) public returns(uint[] memory){
    do{
        j++;
        data.push(j);
     }while(j < 0) ;
      return data;
    }
}

// data == [1]
// 이미 j < 0 조건식에 거짓이지만 한번은 실행함


// for 문

/*
괄호 안에는

- **초깃값:** 반복 횟수를 셀 변수를 초기화하는 부분
- **조건식:** 참인 경우에 반복 수행
- **증감식:** 초깃값을 담은 변수를 변화시킴. 매 반복 시 한 번씩 실행

3가지를 세미콜론으로 구분하여 넣어야 합니다.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract ForLoop {
    uint[] data;

    function loop(
    ) public returns(uint[] memory){
    for(uint i=0; i<5; i++){
        data.push(i);
     }
      return data;
    }
}

// data == [0, 1, 2, 3, 4]

// continue

/*
continue는 반복문 실행 도중 나머지 코드를 건너뛰고 싶을 때 사용합니다.

while, do-while, for 문 안에 사용할 수 있습니다.
*/

while(조건식) {
   조건식이 참이면 여기 있는 코드 수행
  <새로운 조건 추가>{
     continue;
    조건에 만족하면 아래 코드를 실행하지 않고 건너뛴다.
  }
   카운터값 증가
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract ContinueLoop {
    uint[] data;
    uint8 j = 0;

     function loop(
    ) public returns(uint[] memory){
    while(j <= 100) {
        j++;
        if(j % 2 != 0){ // j를 2로 나누었을 때 나머지가 0이 아니라면. 즉 홀수라면.
            continue; // 아래 코드를 실행하지 않고 건너뜀.
        }
        data.push(j);
     }
      return data;
    }
}

// data == [2, 4, 6, 8, ..., 100]

// break 
/*
break은 중간에 반복문을 멈추고 바깥으로 나가고 싶을 때 사용합니다.

while, do-while, for 문 안에 사용할 수 있습니다.
*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract BreakLoop {
    uint[] data;
    uint8 j = 0;

     function loop(
    ) public returns(uint[] memory){
    while(j <= 100) {
        j++;
        if(j == 5){ // j가 5가 되었을 때
            break; // while 반복문을 빠져나감
        }
        data.push(j);
     }
      return data;
    }
}

// data == [1, 2, 3, 4]