// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

contract ExampleRequire {
    mapping(address => uint8 ) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value)); // assert akan selalu memastikan input akan selalu dalam kondisi benar dan jika ada false maka akan error
        // kondisi disini akan mengecek jika msg.value itu akan sama dengan msg.value dengan uint8 yaitu angka 0 - 255
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {

        require(_amount <= balanceReceived[msg.sender], "Fund insufficient"); // pakai require atau revert
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
        
        
    }



}