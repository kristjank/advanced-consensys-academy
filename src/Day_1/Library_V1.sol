// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

struct Data {
    address[] owners;
    mapping(address => uint256) ownerBalances;
}

library Salomon {
    function distributeFunds(Data storage self, uint256 amount) public {
        uint256 split = amount / self.owners.length;
        uint256 remainder = amount % self.owners.length;
        self.ownerBalances[self.owners[0]] += remainder;

        for (uint256 i = 0; i < self.owners.length; i++) {
            self.ownerBalances[self.owners[i]] += split;
        }
    }
}

// uint8 storage and setter
contract Library_V1 {
    Data users;

    function splitFunds() public payable {
        Salomon.distributeFunds(users, msg.value);
    }

    function addOwner() public {
        // this should have checks, using this to just illustrate a point
        users.owners.push(msg.sender);
    }
}

/*
    In this smart contract, the task is to use library for distributeFunds & check for gas usage for deploying and calling the methods.
*/
