// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExamplePureAndPure {

    uint public myStrgVar;

    function getMyStrVar() public  view returns(uint){
        return myStrgVar;
    }

    function getAdd(uint a, uint b) public pure returns(uint){
        return a + b;
    } 

    function setMyStrVar(uint _newVar) public returns(uint) {
        myStrgVar = _newVar;
        return _newVar;
    }
}