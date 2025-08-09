// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract MappingStructExample {
    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;

        // Transaction memory deposit = Transaction(msg.value, block.timestamp);
        // balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = Transaction( msg.value, block.timestamp); // alternatif yang lain
        balances[msg.sender].numDeposits++;
    }

    function withdrawMoney (address payable _to, uint _amount) public {
        balances[msg.sender].totalBalance -= _amount;

        Transaction memory witdraw = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = witdraw;
        balances[msg.sender].numWithdrawals++;



        _to.transfer(_amount);
    }

    function accessDeposits(uint _index ) public view returns (Transaction memory) {
        return balances[msg.sender].deposits[_index];
    }

    function accessWithdrawals(uint _index) public view returns (Transaction memory) {
        return balances[msg.sender].withdrawals[_index];
    }
}