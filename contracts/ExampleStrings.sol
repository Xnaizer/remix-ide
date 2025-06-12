// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleStrings {
    string public myString = "Hello World";
    bytes public  myBytes = "Hello World";
    event logStringLength(uint256 length);

    function setString ( string memory _str) public {
        myString = _str;
    }

    function compareString(string memory _str) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_str));
    }

    function logLength(string memory _myStr) public {
        // emit logStringLength(_myStr.length); // Member "length" not found or not visible after argument-dependent lookup in string memory.
        
        emit logStringLength(bytes(_myStr).length);
    }
    
}