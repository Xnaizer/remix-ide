// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ExampleMapping {

 mapping(uint => bool) public myMapping;
 mapping(address => bool) public myAddMap;
 mapping (uint => mapping (uint => bool)) public nestedMap;

 function setValue(uint _index) public {
    myMapping[_index] = true;
 }

 function viewMyMap (uint _indexKey) public view returns (bool){
    return myMapping[_indexKey];
 }

 function setAddress(address _address) public {
    myAddMap[_address] = true;
 }

 function nestedMyMap(uint _key1, uint _key2, bool _value) public {
    nestedMap[_key1][_key2] = _value;
 }

}