// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract ExampleMappingStruct {

    struct Transaction {
        uint amount;
        uint timestamp;
    }

    struct Balance {
        uint totalBalance;
        uint numDeposits;
        mapping(uint => Transaction) deposits;
        // mapping(uint => Transaction) public  deposits; // ini akan eror karna tidak bisa mengakses function view jika didalam struct
        uint numWithdrawals;
        mapping(uint => Transaction) withdrawal;
    }

    mapping(address => Balance) public  balances; // tambahkan public untuk dapat melihat functio supaya bisa dipanggil

    function DepositMoney () public payable {
        balances[msg.sender].totalBalance += msg.value;

        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = Transaction(msg.value, block.timestamp);
        balances[msg.sender].numDeposits++;
    }

    function WithdrawMoney (uint _amount, address payable _to) public {
        balances[msg.sender].totalBalance -= _amount;
        
        Transaction memory withdraw = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawal[balances[msg.sender].numWithdrawals] = withdraw;
        // balances[msg.sender].withdrawal[balances[msg.sender].numWithdrawals] = Transaction(_amount,block.timestamp); // alternatif
        balances[msg.sender].numWithdrawals++;
        _to.transfer(_amount);
    }

    function viewDeposits(uint _index) public view returns(Transaction memory) {
        return balances[msg.sender].deposits[_index];
    }

    function viewWithdrawals(uint _index) public view returns(Transaction memory) {
        return balances[msg.sender].withdrawal[_index];
    }


    // karna menggunakan mapping kita tak akan pernah tahu berapa length dari mapping tersebut untuk mengetahui jumlah data, digunakanlah alternatif dengan menggunakan variable lain untuk menghitung seperti numDeposits dan numWithdrawals lalu nantinya setiap function dipanggil akan mengambahkan 1 setiap kali dipanggil seperti balances[msg.sender].numDeposits++;
}