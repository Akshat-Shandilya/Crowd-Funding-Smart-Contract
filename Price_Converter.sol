// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 

library PriceConverter {  
    // We could make this public, but then we'd have to deploy it
    

    function getPrice() internal view returns (uint256) {

        AggregatorV3Interface dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );

        // Sepolia Testnet : ETH / USD Address
        // https://docs.chain.link/data-feeds/price-feeds/addresses
   
        (, int256 answer, , , ) = dataFeed.latestRoundData();
        // The function returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound)
        // But we need only "answer", not the others

        uint256 decimals = uint256(getDecimals());        
        return uint256( uint256(answer) * (1e18) / (10**(decimals)) );
        //This function returns the price of 1eth in USD * 1e18. We are doing this to get accuracy in decimals.
        // If we do not do this we will get a rounded off integer value of the price.
    }

    function getDecimals() internal view returns (uint8) {
        AggregatorV3Interface dataFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        return dataFeed.decimals();
        // Actual price = Price / (10* number of decimals) 
    }

    function ETHToUSD (uint256 ethAmount) internal view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / (1e18) ;
        // Default unit is wei and 1 eth = 1wei * 1e18
        // the actual ETH/USD conversion rate, after adjusting the extra 0s.
        return ethAmountInUsd;
    }

}
