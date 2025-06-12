// SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract MyContract {

    string public myString = "Hi, I'm Xnaizer!";

    function setMyString (string memory _newString) public {
        myString = _newString;
    }

}