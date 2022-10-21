// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.14; // 0.8.14 버전을 사용합니다

contract SimpleStorage {
    uint storedData; // 상태 변수

    //함수
    function set(uint x) public {
        storedData = x;
    }
    // 함수
    function get() public view returns (uint) {
        return storedData;
    }
}