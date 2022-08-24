// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

abstract contract BaseContract {
    function doWork(uint256 start) public pure returns (uint256) {
        for (uint256 i = 1; i < 100; i++) {
            start++;
        }
        return start;
    }
}

contract Inherit_V1 is BaseContract {
    uint256 val;

    function work(uint256 i) public {
        val = doWork(i);
    }
}

/*
    In this smart contract, the task is to use inheritance to optimize & modularize the contract.
*/
