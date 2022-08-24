// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Inherit_V0 {
    uint256 val;

    function work(uint256 i) public {
        val = doWork(i);
    }

    function doWork(uint256 start) private pure returns (uint256) {
        for (uint256 i = 1; i < 100; i++) {
            start++;
        }
        return start;
    }
}

/*
    In this smart contract, the task is to use inheritance to optimize & modularize the contract.
*/
