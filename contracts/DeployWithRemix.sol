// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleContract {
    string public myString = "Hello World";

    function updateString(string memory _updateString) public payable   {
       if(msg.value == 1 ether) {
         myString = _updateString;
       } else {
        payable(msg.sender).transfer(msg.value);
       }
    }

    function balanceOf() public view returns (uint256) {
        return msg.sender.balance;
    }

    function balanceOfContract (address _inputAddress) public view returns (uint256) {
        return _inputAddress.balance;
    }
}