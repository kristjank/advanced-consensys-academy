// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// uint8 storage and setter
contract Library_V0 {
    address[] owners;
    mapping(address => uint256) ownerBalances;

    function splitFunds() public payable {
        distributeFunds(msg.value);
    }

    function addOwner(address owner) public {
        // this should have checks, using this to just illustrate a point
        owners.push(owner);
    }

    function distributeFunds(uint256 amount) private {
        uint256 split = amount / owners.length;
        uint256 remainder = amount % owners.length;
        ownerBalances[owners[0]] += remainder;

        for (uint256 i = 0; i < owners.length; i++) {
            ownerBalances[owners[i]] += split;
        }
    }
}

/*
    In this smart contract, the task is to use library for distributeFunds & check for gas usage for deploying and calling the methods.
*/
