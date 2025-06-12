//SPDX-License-Identifier: MIT
 
pragma solidity 0.8.14;
 
contract ExampleBoolean {
 
    bool public myBool;
    string public name1;
    string public name2;
 
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    function isTheSame(string memory _name1, string memory _name2) public pure returns (bool) {
        // return _name1 == _name2;
        // return bytes(_name1) == bytes(_name2); /// masih engga bisa
        return keccak256(bytes(_name1)) == keccak256(bytes(_name2)); 
    }
 
}