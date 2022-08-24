// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Arrays_And_Mappings_V0} from "../src/Day_1/Arrays_And_Mappings_V0.sol";
import {Arrays_And_Mappings_V1} from "../src/Day_1/Arrays_And_Mappings_V1.sol";
import {DataTypes_Packed_V0} from "../src/Day_1/DataTypes_Packed_V0.sol";
import {DataTypes_Packed_V1} from "../src/Day_1/DataTypes_Packed_V1.sol";
import {StringsVsBytes_V0} from "../src/Day_1/StringsVsBytes_V0.sol";
import {StringsVsBytes_V1} from "../src/Day_1/StringsVsBytes_V1.sol";
import {Structs_V0} from "../src/Day_1/Structs_V0.sol";
import {Structs_V1} from "../src/Day_1/Structs_V1.sol";
import "../src/Day_1/Library_V0.sol";
import "../src/Day_1/Library_V1.sol";

import "../src/Day_1/Inherit_V0.sol";
import "../src/Day_1/Inherit_V1.sol";

import {TestHelpers} from "./TestHelpers.sol";

contract Day_1_Test is Test, TestHelpers {
    Arrays_And_Mappings_V0 public arraysV0;
    Arrays_And_Mappings_V1 public arraysV1;
    DataTypes_Packed_V0 public dataTypesV0;
    DataTypes_Packed_V1 public dataTypesV1;
    StringsVsBytes_V0 public stringsBytesV0;
    StringsVsBytes_V1 public stringsBytesV1;
    Structs_V0 public structsV0;
    Structs_V1 public structsV1;
    Library_V0 public libV0;
    Library_V1 public libV1;
    Inherit_V0 public inheritV0;
    Inherit_V1 public inheritV1;



    function setUp() public override {
        TestHelpers.setUp();

        arraysV0 = new Arrays_And_Mappings_V0(users);
        arraysV1 = new Arrays_And_Mappings_V1(users);

        dataTypesV0 = new DataTypes_Packed_V0();
        dataTypesV1 = new DataTypes_Packed_V1();

        stringsBytesV0 = new StringsVsBytes_V0();
        stringsBytesV1 = new StringsVsBytes_V1();

        structsV0 = new Structs_V0();
        structsV1 = new Structs_V1();

        libV0 = new Library_V0();
        libV1 = new Library_V1();

        inheritV0 = new Inherit_V0();
        inheritV1 = new Inherit_V1();
    }

    // testing Arrays_And_Mappings
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

    // testing Data_Types
    function testSetInt() public {
        dataTypesV0.setInts();
        dataTypesV1.setInts();
    }

    // testing strings vs bytes
    function testStringsBytes() public {
        stringsBytesV0.setString();
        stringsBytesV0.getString();
        stringsBytesV1.setString();
        stringsBytesV1.getString();
    }

    // testing inMemoryUsage - structs
    function testInMemoryUsage() public {
        structsV0.inMemoryUsage();
        structsV1.inMemoryUsage();
    }

    // testing inMemoryUsage - library
    function testLibraryUsage() public {
        libV0.addOwner(alice);
        libV0.addOwner(bob);
        libV0.addOwner(rik);
        libV0.addOwner(morty);

        libV0.splitFunds{value: 100000 ether};
        //libV0.distributeFunds(100000);
    }

    // testing inheritance - structs
    function testInheritUsage() public {
        inheritV0.work(100);
        inheritV1.work(100);
    }
}
