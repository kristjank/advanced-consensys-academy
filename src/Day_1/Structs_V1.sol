// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Structs_V1 {
    Test test;

    struct Test {
        uint256 a;
        uint256 b;
        bytes32 c;
        bytes32 d;
    }

    function inMemoryUsage() public {
        test = Test(1,2,"a","b");
    }
}
/*
    In this exercise, modify the contract to use memory to update the storage `test` variable.
    Compare the gas usage for `inMemoryUsage` method. 
*/
