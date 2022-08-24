// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract QuizFactory {
    function createQuiz() public {}
}

contract Quiz {
    constructor() {}

    modifier onlyOwner() {
        _;
    }

    modifier onlyPeriod(uint256 fromDays, uint256 toDays) {
        _;
    }

    function compareStrings() public {}

    function commitGuess() public {}

    function revealAnswer() public {}

    function revealGuess() public {}

    function withdrawPrize() public {}

    function destroyQuiz() public {}
}
