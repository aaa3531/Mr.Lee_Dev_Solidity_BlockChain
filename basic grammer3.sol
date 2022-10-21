// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다


//  이벤트, 에러, 상속

contract coinTransfer {
	// event 이벤트명(파라미터유형1 파라미터1, 파라미터유형2 파라미터2, ...);
	event Transfer(address from, address to, uint256 value);

	function transfer(address to, uint256 amount) {
		//...

		// emit 이벤트명(인자1, 인자2 ...)
		emit Transfer(msg.sender, to, amount);
	}
}

// 에러 핸들링

pragma solidity ^0.8.14;

contract VendingMachine {
    address owner;

    function buy(uint amount) public payable {
        if (amount > msg.value / 2 ether)
            revert("Not enough Ether provided."); //에러를 반환하면서 에러 메시지를 지정할 수 있습니다

        // 송금 진행
    }
}

// 게이트 키퍼

pragma solidity ^0.8.14;

contract VendingMachine {
    address owner;

    function buy(uint amount) public payable {
        require(
            amount <= msg.value / 2 ether,  // 주어진 조건이 참이면 넘어가고, 거짓이면 에러 반환
            "Not enough Ether provided."  // 에러 메시지를 지정할 수 있습니다
        );

        // 송금 진행
    }
}

// 상속

contract ChildContract is ParentContract {
  // ...
}

contract ChildContract is ParentContract1, ParentContract2, ParentContract3 {
  // ...
}

// 라이브러리

/*
라이브러리의 목적은 “코드를 공유"하기 위함입니다.

컨트랙트 간에 코드를 공유하거나, 공통적인 기능을 재사용하고자 할 때 우리는 라이브러리를 활용합니다.

참고:

- [https://www.openzeppelin.com/](https://www.openzeppelin.com/)

외부 라이브러리를 호출할 시에는 기존 컨트랙트 호출과는 다른 방식으로 진행합니다.

- contract 키워드 대신 library 키워드 사용
- 상태 변수, 상속 관계, fallback 함수, payable 함수 지원 안 됨
- 파라미터 받는 것 가능
- 호출 방법:
*/

import "./UIntFunctions.sol";
contract Example {
    function isEven(uint x) public pure returns(bool) {
        return UIntFunctions.isEven(x);
    }
}

import "./UIntFunctions.sol";
contract Example {
    using UIntFunctions for uint;
    function isEven(uint x) public pure returns(bool) {
        return x.isEven();
    }
}




