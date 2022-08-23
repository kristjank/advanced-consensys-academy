// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Arrays_And_Mappings_V0} from "../src/Day_1/Arrays_And_Mappings_V0.sol";
import {Arrays_And_Mappings_V1} from "../src/Day_1/Arrays_And_Mappings_V1.sol";
import {TestHelpers} from "./TestHelpers.sol";

contract Arrays_And_Mappings_Test is Test, TestHelpers {
    Arrays_And_Mappings_V0 public arraysV0;
    Arrays_And_Mappings_V1 public arraysV1;

    function setUp() public override {
        TestHelpers.setUp();
        arraysV0 = new Arrays_And_Mappings_V0(users);
        arraysV1 = new Arrays_And_Mappings_V1(users);
    }

    function testAddOwner() public {
        arraysV0.addOwner();
        arraysV1.addOwner();
    }

    function testCheckOwner() public {
        vm.startPrank(alice);
        arraysV0.checkOwner();
        arraysV1.checkOwner();
        vm.stopPrank();
    }
}
