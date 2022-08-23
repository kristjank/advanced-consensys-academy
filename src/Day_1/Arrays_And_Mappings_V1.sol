// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract Arrays_And_Mappings_V1 {
    mapping(address => bool) owners;

    constructor(address[] memory addresses) {
        for (uint256 index = 0; index < addresses.length; index++) {
            owners[addresses[index]] = true;
        }
    }

    function addOwner() public {
        owners[msg.sender] = true;
    }

    function checkOwner() public isOwnerCheck {}

    modifier isOwnerCheck() {
        require(owners[msg.sender], "not owner");
        _;
    }
}

/*
   In this smart contract, we have used array for storing the owners.
   Task is to modify the contract to use mapping instead of arrays & compare the gas needed to deploy and interact with methods AddOwner and CheckOwner.
*/
