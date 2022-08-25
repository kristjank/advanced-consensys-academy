// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import {Test} from "../lib/forge-std/src/Test.sol";
import {console2} from "@forge-std/src/console2.sol";

import "../src/Day_2/QuizFactory.sol";
import "../src/Day_2/Quiz.sol";

import {TestHelpers} from "./TestHelpers.sol";

contract QuizFactoryTest is Test, TestHelpers {
    QuizFactory public quizFactory;

    function setUp() public override {
        TestHelpers.setUp();
    }

    function testQuizCreate() public {
        quizFactory = new QuizFactory();
        bytes32 quizSealedAnswer = keccak256(bytes("answer"));
        address quizAddress = quizFactory.createQuiz(
            "question",
            quizSealedAnswer
        );

        assertEq(quizFactory.getQuizCount(), 1);
        assertEq(quizFactory.getQuizById(quizSealedAnswer), quizAddress);
        assertEq(quizFactory.getQuizByIndex(0), quizAddress);
    }

    function testQuizCommitGuess() public {
        vm.startPrank(alice);
        quizFactory = new QuizFactory();
        bytes32 quizSealedAnswer = keccak256(bytes("answer"));
        address quizAddress = quizFactory.createQuiz(
            "question",
            quizSealedAnswer
        );

        bytes32 correctSealedAnswer = keccak256(bytes("answer"));
        bytes32 falseSealedAnswer = keccak256(bytes("answer"));

        helperCommitGuess(
            quizAddress,
            alice,
            correctSealedAnswer,
            "salt123alice"
        );

        helperCommitGuess(quizAddress, bob, falseSealedAnswer, "salt123bob");
        helperCommitGuess(quizAddress, rik, correctSealedAnswer, "salt123rik");
        helperCommitGuess(
            quizAddress,
            morty,
            falseSealedAnswer,
            "salt123morty"
        );

        uint256 guessCount = Quiz(quizAddress).getGuessesCount();

        assertEq(guessCount, 4);
        vm.stopPrank();
    }

    function helperCommitGuess(
        address quizAddress,
        address sender,
        bytes32 sealedGuess,
        string memory saltGuess
    ) private {
        //vm.startPrank(sender);
        //Quiz(quizAddress).commitGuess(sealedGuess, saltGuess){value: 100 ether};
        Quiz(quizAddress).commitGuess(sealedGuess, saltGuess);

        //vm.stopPrank();
    }

    function helperCommitGuessCall(
        address quizAddress,
        address sender,
        bytes32 sealedGuess,
        string memory saltGuess
    ) private {
        vm.startPrank(sender);
        //IQuiz(quizAddress).commitGuess{value: 1 ether}(sealedGuess, saltGuess);
        (bool success, bytes memory returnedData) = quizAddress.call{
            value: 1 ether
        }(
            abi.encodeWithSignature(
                "commitGuess(bytes32 _sealedGuess, string memory _saltGuess)",
                sealedGuess,
                saltGuess
            )
        );
        require(success, "call failed");
        vm.stopPrank();
    }

    function helperGetGuessesCount(address quizAddress)
        private
        returns (uint256)
    {
        address externalContract = address(quizAddress);
        (bool success, bytes memory returnedData) = externalContract.call(
            abi.encodeWithSignature("getGuessesCount()")
        );
        vm.stopPrank();
        //console2.log("sadasdadasdadasd");
        console2.logBytes(returnedData);
        return uint256(1);
    }
}
