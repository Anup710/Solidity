// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0; 

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol" ; //alternative to using an interface

contract FundMe {
    
    mapping (address => uint256) public addressToAmountFunded ; //to keep track of which address donates how much money. 
    address public owner; 

    constructor() public{
        owner = msg.sender ; //to initialize owner the moment the contract is deployed, used later while withdrawing. 
    }

    function fund() public payable{
        addressToAmountFunded[msg.sender] += msg.value ; // msg.sender is anme of sender and msg.value is the amt of funsing
    }
    // so whenever fund() is called, user will be able to send money since its 'payable' function. 
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();  
    }

    function getPrice() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e); 
        (,int256 answer,,,) = priceFeed.latestRoundData(); //latestrounddata is part in the imported interface, which returns multiple returns and only int256 answer is relevant to us. 
        return uint256(answer*10000000000); 
    }

    //new function to convert value sent to USD equivalent

    function getCoversionRate (uint256 _ethAmount) public view returns(uint256) {
            uint256 ethPrice = getPrice() ; 
            uint256 ethAmountinUSD = (_ethAmount * ethPrice)/ 1000000000000000000 ; 
            return ethAmountinUSD ;

    }

    function withdraw() payable public{
        require (owner == msg.sender) ; //as ensured by the constructor, so that only rightful owner can withdraw money. 
        msg.sender.transfer(address(this).balance) ; 
    }
}

//Further, a modify statement can be added instead of the require (owner == msg.sender) statement. 

// Also, an independent array can be maintained, which keeps updates the balance 
// of the donations made to 0 for each donor after they have been withdrawn by the owner. 
// check github for that code. 
// Execution explained in the video from 3:20:00 to 3:30:00. 