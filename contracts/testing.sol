// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AbiVsBytesDemo {
    string public text = "abc";
    uint256 public number = 123;

    function getBytesHash() public view returns (bytes32) {
        // Hash dari raw bytes string
        return keccak256(bytes(text));
    }

    function getAbiEncodeHash() public view returns (bytes32) {
        // Hash dengan ABI encoding (dengan length + padding)
        return keccak256(abi.encode(text));
    }

    function getAbiEncodePackedHash() public view returns (bytes32) {
        // Hash tanpa padding (gabungan rapat)
        return keccak256(abi.encodePacked(text));
    }

    function getAbiEncodeMultipleHash() public view returns (bytes32) {
        // Hash multi argumen aman
        return keccak256(abi.encode(text, number));
    }

    function getAbiEncodePackedMultipleHash() public view returns (bytes32) {
        // Hash multi argumen raw (ada potensi collision)
        return keccak256(abi.encodePacked(text, number));
    }

    function getRawBytes() public view returns (bytes memory) {
        // Lihat raw bytes dari string
        return bytes(text);
    }

    function getAbiEncodeBytes() public view returns (bytes memory) {
        // Lihat hasil ABI encode
        return abi.encode(text);
    }

    function getAbiEncodePackedBytes() public view returns (bytes memory) {
        // Lihat hasil ABI encodePacked
        return abi.encodePacked(text);
    }
}
