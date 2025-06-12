//SPDX-License-Identifier: MIT
 
pragma solidity 0.8.15;
 
contract ExampleWrapAround {
    uint256 public myUint;
 
    function decrementUintUnchecked() public {
        unchecked { // sebelum versi 0.8.0 keatas, ketika melakukan pengurangna uint itu    2^256 <- 0 -> 2^8 bukan -3 -2 -1 0 1 2 3, jadi hasilnya 123t............24234234234234 0 1 2 3 4
            myUint--;
        }
    }
 
    function decrementUint() public {
        myUint--; // ini bakalan error
    }
}