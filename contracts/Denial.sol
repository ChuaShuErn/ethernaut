// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Denial {

    address public partner; // withdrawal partner - pay the gas, split the withdraw
    address public constant owner = address(0xA9E);
    uint timeLastWithdrawn;
    mapping(address => uint) withdrawPartnerBalances; // keep track of partners balances

    constructor() payable {
        
    }
    function setWithdrawPartner(address _partner) public {
        partner = _partner;
    }

    // withdraw 1% to recipient and 1% to owner
    function withdraw() public {
        uint amountToSend = address(this).balance / 100;
        // perform a call without checking return
        // The recipient can revert, the owner will still get their share
        partner.call{value:amountToSend}("");
        payable(owner).transfer(amountToSend);
        // keep track of last withdrawal time
        timeLastWithdrawn = block.timestamp;
        withdrawPartnerBalances[partner] +=  amountToSend;
    }

    // allow deposit of funds
    receive() external payable {}

    // convenience function
    function contractBalance() public view returns (uint) {
        return address(this).balance;
    }
}

//instance address
//0xbF964B1600B3c396afBBf8763C220C2dEFD8E4af

//player address
//0xE842987E5078a20bA7235865a90257F62fa63674

//mission -> 
// Deny owner from withdrawing funds when they call withdraw();
// contract must still have funds
// transactions is of 1m gas or less


// What are some ways Denial of service/ gas griefing can occur?
// so Infinite Loops cost gas 


// 