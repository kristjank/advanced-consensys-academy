// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract SaveGas_V1 {
    uint256[] myArray = [1, 2, 3, 4, 5, 6, 7];

    function getSum() external view returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < myArray.length; i++) {
            sum += myArray[i];
        }
        return sum;
    }
}

/*
    In this contract, the task is to modify the UseUint() method to use memory for accessing the variable.
    Check the difference in gas usage when calling the method.
*/
