// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {Test} from "../lib/forge-std/src/Test.sol";
import {Utils} from "./Utils.sol";


abstract contract TestHelpers is Test {
    Utils utils;
    
    address[] internal users;
    address internal alice;
    address internal bob;
    address internal rik;
    address internal morty;


    modifier asPrankedUser(address user) {
        vm.startPrank(user);
        _;
        vm.stopPrank();
    }

    function setUp() public virtual {
        utils = new Utils();
        users = utils.createUsers(5);

        alice = users[0];
        vm.label(alice, "Alice");
        bob = users[1];
        vm.label(bob, "Bob");
        rik = users[2];
        vm.label(rik, "Rik");
        morty = users[3];
        vm.label(morty, "Morty");
    }
}
