// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleConstructor {

    address public myAddress;


    constructor(address _address) {
        myAddress = _address;

    }

    function setMyAddress(address _newAddress) public {
        myAddress = _newAddress;
    }

    function setMyAddressToMsgSender() public  {
        myAddress = msg.sender;
    }
}
