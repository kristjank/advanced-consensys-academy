// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import "./Quiz.sol";

contract QuizFactory {
    address[] public quizzes;
    mapping(bytes32 => uint256) quizIds;

    function createQuiz(string calldata _question, bytes32 _sealedAnswer)
        public
        returns (address)
    {
        address quiz = address(new Quiz(msg.sender, _question, _sealedAnswer));
        quizzes.push(quiz);
        quizIds[_sealedAnswer] = quizzes.length - 1;

        return quiz;
    }

    function getQuizCount() public view returns (uint256 count) {
        return quizzes.length;
    }

    function getQuizByIndex(uint256 index) public view returns (address) {
        return quizzes[index];
    }

    function getQuizById(bytes32 _sealedAnswer) public view returns (address) {
        return quizzes[quizIds[_sealedAnswer]];
    }
}
