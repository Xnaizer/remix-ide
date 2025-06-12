// SPDX-License-Identifier: MIT
pragma solidity 0.8.14;

contract ExampleValidCandidates {
    bytes32[] public validCandidates;

    constructor() {
        validCandidates.push(keccak256(abi.encodePacked("James Bond")));
        validCandidates.push(keccak256(abi.encodePacked("Oradalam Nib")));
    }

    function vote(string memory _candidate) public view returns(bool) {
        bytes32 hashedInput = keccak256(abi.encodePacked(_candidate));
        
        for(uint256 i = 0; i < validCandidates.length; i++ ){
            if(hashedInput == validCandidates[i]){
                return true;
            }
        }
        return false;
    }
}