
// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract MyHelloWorld {
    string public sayHi = "Hello World";
    string public person = "Hendry";
    string public kata;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
    }

    function sayHello(string memory _to) public view returns (string memory) {
        return string(abi.encodePacked(sayHi," ",_to));
    }

    function changeSayHi(string memory _changeStr) public onlyOwner {
        sayHi = _changeStr;
    }

    function simpleData(string memory _newPerson, string memory _newSayHi) public onlyOwner returns (string memory){
        person = _newPerson;
        sayHi = _newSayHi;

        kata = string(abi.encodePacked(sayHi," ",person));

        return  kata; // ini tidak ditampilkan karna fungsi yang melakuakan perubaha di sign sebagai transaksi, oleh karna itu gunakan yang tidak merubah data seperti pure atau view functions
        
    }

   


}

