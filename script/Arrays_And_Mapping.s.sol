// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../lib/forge-std/src/Script.sol";



contract DeployContracts is Script {
      function setUp() public {}

    function run() external {
        vm.startBroadcast();

        //Arrays_And_Mappings contract = new Arrays_And_Mappings();

        vm.stopBroadcast();
    }
}
