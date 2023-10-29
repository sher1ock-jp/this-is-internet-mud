// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

function StringToBytesKey(string memory args) pure returns (bytes32) {
    bytes32 encodedArgs = keccak256(abi.encodePacked(args));
    return encodedArgs;
} 

