// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract QuizFactory {
    address[] quizzes;

    function createQuiz(string calldata _question, bytes32 _sealedAnswer)
        public
        returns (address)
    {
        address quiz = address(new Quiz(msg.sender, _question, _sealedAnswer));
        quizzes.push(quiz);

        return quiz;
    }

    function getCount() public view returns (uint256 count) {
        return quizzes.length;
    }

    function getQuiz(uint256 index) public view returns (address) {
        return quizzes[index];
    }
}

contract Quiz {
    address owner;
    string question;
    bytes32 public sealedAnswer;

    constructor(
        address _owner,
        string memory _question,
        bytes32 _sealedAnswer
    ) {
        owner = _owner;
        question = _question;
        sealedAnswer = _sealedAnswer;
    }

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
