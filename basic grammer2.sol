// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다

//  함수
function 함수이름(파라미터형식1 파라미터1, 파라미터형식2 파라미터2, ...) { ... }

function 함수이름(파라미터,...) returns (반환 형식) { ... }

// 함수 접근 수준 - Visibility (public, external, internal, private)

/*
- `public`(default):
    - 외부에서도 접근 가능
    - 컨트랙트 내부, 외부, 클라이언트 코드에서 모두 호출 가능
- `external`:
    - public과 비슷함
    - 외부(external) 컨트랙트나 클라이언트 코드에서 호출 가능
    - 컨트랙트 내부에서는 호출 불가능. `f()`로 호출 불가능
    - 컨트랙트 내부로부터 불릴 경우 `this.f()` 와 같이 `this`를 활용한 호출 가능
- `internal`:
    - 컨트랙트 멤버와 상속된 컨트랙트에서 호출 가능
- `private` :
    - 컨트랙트 멤버만 호출 가능

> 무언가를 internal 또는 private로 만드는 것은 다른 계약이 정보를 읽거나 수정하는 것을 방지할 뿐입니다.
퍼블릭 블록체인 특성상 데이터는 공개되어 있습니다.
>
*/

contract exampleC {
	function changeName(address account, string newName) internal { ... }
	function checkGas(uint256 amount) private returns (bool) { ... }
}

/*
### **Qualifier (view, pure, payable)**

함수가 컨트랙트의 내부 상태를 변경할 수 있는 능력을 선언하는 것입니다.

### **view, pure**

`view`로 표시된 함수는 상태를 변경하지 않는 읽기 전용 함수입니다.

`pure`는 스토리지에서 변수를 읽거나 쓰지 않는 함수입니다.
*/

pragma solidity ^0.8.14;
contract exmapleC {

	unit256 public constant maxLimit = 1000;
  mapping(address => bool) public frozenAccount;

	function checkGas(uint256 amount) private pure returns (bool) {
	    if (amount < maxLimit) return true;
	    return false;
	}

	function validateAccount(address account) internal view returns (bool) {
	   if (frozenAccount[account]) return true;
	   return false;
	}
}

// payable

pragma solidity ^0.8.14;
contract exmapleC {

	function getEther() payable returns (bool) {
	    if (msg.value === quoteFee) {
				// ...

			}
		}
}

// 생성자 함수(constructor)

/*
생성자 함수를 선언하면, 컨트랙트가 생성될 때 생성자 함수가 실행되며 컨트랙트의 상태를 초기화할 수 있습니다.

`constructor` 키워드를 사용해 생성자 함수를 선언할 수 있습니다.

- 생성자 함수는 컨트랙트 당 1개만 작성해야 합니다.
- 생성자 함수를 작성하지 않으면 자동으로 기본 생성자(default constructor)가 생성됩니다.
- 생성자 함수의 함수 접근 수준(visibility)은 internal 이거나 public이어야 하지만, 0.7 버전 이후부터는 visibility를 붙이지 않습니다.([solidity v.0.7.0 에서 반영된 부분](https://docs.soliditylang.org/en/v0.8.17/070-breaking-changes.html#:~:text=Visibility%20(public%20/%20internal)%20is%20not%20needed%20for%20constructors%20anymore%3A%20To%20prevent%20a%20contract%20from%20being%20created%2C%20it%20can%20be%20marked%20abstract.%20This%20makes%20the%20visibility%20concept%20for%20constructors%20obsolete.)))
*/

pragma solidity ^0.8.14;
contract exmapleC {

    address public account;

    constructor(address _account) {
        account = _account;
    }
}

selfdestruct(컨트랙트 생성자의 주소);

// 함수 제어자(modifier)

/*비슷한 역할을 하는 코드를 모아서 만든 특별한 형태의 함수입니다.

함수 선언에 `modifier`를 추가하여 함수에 변경자를 적용할 수 있습니다.

> 변경자: 함수를 실행하기 전, 요구 조건을 만족하는지 확인하는 작업
> 

변경자를 작성할 때는 `_;`를 사용합니다. `_;`는 함수를 실행하는 시점을 나타내며, 변경자 코드는 `_;` 코드를 기준을 실행 시점이 달라집니다. `_;` 이전의 코드는 함수가 실행되기 전에 실행되고, `_;` 이후의 코드는 함수 실행이 종료되고 실행됩니다.

다음의 `changeNum` 변경자는 함수를 실행하기 전, `num` 상태 변수의 값을 1 올리고, 함수의 실행이 완료되면 `num` 상태 변수의 값을 1 내립니다.
*/

int public num = 0;
modifier changeNum {
	num++;  // 함수 실행 전 실행됨
	_;  // 함수 실행
	num--; // 함수 실행 후 실행됨
}

function func() public changeNum {
	if (num == 1) {
		// do something
	}
}



