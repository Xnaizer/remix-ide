// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract SampleFallback {

    uint public  lastValueSent;
    string public  lastFunctionCalled;

    uint public myUint;
    
    function setMyUint(uint _newUint) public {
        myUint = _newUint;
    }

    receive() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";

    }

    fallback() external  payable  {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }

    // 0xe492fd840000000000000000000000000000000000000000000000000000000000000002
    // kode diatas diambil dari input di log
    // web3.utils.sha3("setMyUint(uint256)")
    // 0xe492fd842fb25dc4b3c624c80776108b452a545c682a78e4252b5560c6537b79

    // 0xe492fd84 = setMyUint
    // (uint256) = 0000000000000000000000000000000000000000000000000000000000000002
}