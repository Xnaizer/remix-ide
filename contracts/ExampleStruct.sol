// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract wallet {
    // address sender;
    // uint valueSent;
    // use class instead

    PaymentReceived public payment;
    

    function payContract() public payable {
        // sender = msg.sender;
        // valueSent = msg.value;
        payment = new PaymentReceived(msg.sender, msg.value);
    }

}


contract PaymentReceived {
    address public from;
    uint public amount;

    constructor(address _from, uint _amount) {
        from = _from;
        amount = _amount;
    }
}


contract wallet2 {

    struct PaymentReceivedStruct {  // use strct instead to lower the gas rather use inheritance contract
    
        address from;
        uint amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        // payment = PaymentReceivedStruct(msg.sender, msg.value); // #1
        payment.from = msg.sender; // #2
        payment.amount = msg.value;
    }
}