// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// string getter and setter
contract StringsVsBytes_V1 {
    bytes32 s;

    function setString() public {
        s = "thisisthirtytwocharactersyesitis";
    }

    function getString() public view returns (bytes32) {
        return s;
    }
}

/*
    In this smart contract, we have used string  for storage.
    Task is to modify the contract to use bytes instead of string  & compare the gas needed to deploy and interact with methods SetString and GetString methods.
*/
