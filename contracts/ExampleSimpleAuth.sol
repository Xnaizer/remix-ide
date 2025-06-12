// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleSimpleAuth {
    address public owner;
    bytes32 private passwordHash;

    constructor(string memory _password) {
        owner = msg.sender;
        passwordHash = keccak256(abi.encodePacked(_password));
    }

    function isPassCorrect(string memory _pass) public view returns(bool) {
        return keccak256(abi.encodePacked(_pass)) == passwordHash;
    }
}