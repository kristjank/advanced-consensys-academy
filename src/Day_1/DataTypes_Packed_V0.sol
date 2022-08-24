// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

// uint8 storage and setter
contract DataTypes_Packed_V0 {
    uint128 a;
    uint256 b;
    uint128 c;

    function setInts() public {
        a = 1;
        b = 2;
        c = 3;
    }
}

/*

    Update the given smart contract and compare the gas usage when calling SetInts() method.
    Hint: State Packing

*/
