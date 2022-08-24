// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "../lib/forge-std/src/Test.sol";

import "../src/Day_2/QuizFactory.sol";

import {TestHelpers} from "./TestHelpers.sol";

contract QuizFactoryTest is Test, TestHelpers {
    QuizFactory public quizFactory;

    function setUp() public override {
        TestHelpers.setUp();
        quizFactory = new QuizFactory();
    }

    function testCreateQuiz() public {
        address quizAddress = quizFactory.createQuiz("question", "answer");
        assertEq(quizFactory.getCount(), 1);
        assertEq(quizFactory.getQuiz(0), quizAddress);
    }
}
