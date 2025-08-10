// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract ExampleRequire {
    mapping(address => uint) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint _amount) public {
        // if(_amount <= balanceReceived[msg.sender]){
        //     balanceReceived[msg.sender] -= _amount;
        //     _to.transfer(_amount);
        // } else {
        //     return string("erorr"); // ini akan error karna tidak bisa cara ini di solidity
        // }

        // if(_amount <= balanceReceived[msg.sender]){
        //     balanceReceived[msg.sender] -= _amount;
        //     _to.transfer(_amount);
        // } // kalo gini aja tidak eror tapi tidak tau jika terjadi error atau tidak
        
        require(_amount <= balanceReceived[msg.sender], "Fund insufficient"); // pakai require atau revert
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
        
    }



}