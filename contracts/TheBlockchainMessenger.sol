// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract TheBlockchainMessenger {
    address public owner;
    uint public changeCounter;
    string public theMessage;

    constructor() {
        owner = msg.sender;
    }

    function updateTheMessage(string memory _newMsg) public {
        if(msg.sender == owner){
            theMessage = _newMsg;
            changeCounter++;
        }
    }

}