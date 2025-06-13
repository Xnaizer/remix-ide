// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleAddress {

    address public someAddress;

    function setSomeAddress(address _setAddress) public {
        someAddress = _setAddress;
    }

    function getAddressBalance() public view returns (uint) {
        return someAddress.balance;
    }
}