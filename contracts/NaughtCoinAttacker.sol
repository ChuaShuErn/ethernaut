// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import "contracts/NaughtCoin.sol";

contract NaughtCoinAttacker {

        NaughtCoin public target;


        constructor(address _target){
                target = NaughtCoin(_target);
        }


        function transferFrom(address from, address to, uint256 value) public returns (bool){
                target.transferFrom(from,to,value);
                return true;
        }
        





}