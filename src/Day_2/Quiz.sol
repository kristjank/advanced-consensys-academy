// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

import {console2} from "@forge-std/src/console2.sol";

contract Quiz {
    struct Guess {
        address owner;
        bytes32 sealedGuess;
        string revealedGuess;
        string saltGuess;
    }

    address owner;
    string question;
    bytes32 public sealedAnswer;
    uint256 creationTimestamp = block.timestamp;

    mapping(address => Guess) public guessess;
    uint256 guessessCount;

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
        require(msg.sender == owner);
        _;
    }

    modifier onlyPeriod(uint256 fromDays, uint256 toDays) {
        require(
            block.timestamp >= creationTimestamp + fromDays * 1 days &&
                block.timestamp <= creationTimestamp + toDays * 1 days
        );
        _;
    }

    function compareStrings(string memory _a, string memory _b)
        private
        pure
        returns (bool)
    {
        bytes memory s1bytes = bytes(_a);
        bytes memory s2bytes = bytes(_b);

        if (s1bytes.length != s2bytes.length) return false;

        if (keccak256(s1bytes) == keccak256(s2bytes)) return true;

        return false;
    }

    // TODO: add modifiers
    function commitGuess(bytes32 _sealedGuess, string memory _saltGuess)
        public
        payable
    {
        require(msg.value >= 1 ether, "Insufficient funds");

        Guess memory guess;
        guess.owner = msg.sender;
        guess.sealedGuess = _sealedGuess;
        guess.saltGuess = _saltGuess;

        guessess[msg.sender] = guess;
        guessessCount++;

        if (msg.value > 1 ether) {
            payable(msg.sender).transfer(msg.value - 1 ether);
        }
    }

    function getGuessesCount() public view returns (uint256) {
        return guessessCount;
    }

    function revealAnswer() public {}

    function revealGuess() public {}

    function withdrawPrize() public {}

    function destroyQuiz() public {}
}
