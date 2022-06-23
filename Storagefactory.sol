// SPDX-License-Identifier: MIT
// SS = shorthand for SimpleStorage

pragma solidity >=0.5.0 <= 0.6.0;

//we want to deploy multiple simple storga econtract through the storage factory. 
import "./SimpleStorage.sol" ;

contract StorageFactory {

    SimpleStorage[] public SimpleStorageArray; //an array to keep track of deployed contracts

    function createSimpleStorageContract() public {
        SimpleStorage ss = new SimpleStorage() ; //creates a new SimpleStorage contract named ss taking in no parameters
        SimpleStorageArray.push(ss) ; //adds ss to the tracking array
    }

    function sfStore (uint256 _SimpleStorageIndex, uint256 _SimpleSTorageNumber) public{
        // Address and ABI of contract we need to interact are needed. 

        SimpleStorage ss = SimpleStorage(address(SimpleStorageArray[_SimpleStorageIndex])) ;
        // choosing the contract at index _SSIndex in the SSArray
        ss.store(_SimpleSTorageNumber) ;
        //store function picked up from simplestorage.sol while importing. 
    }

    function sfGet(uint256 _SimpleStorageIndex) public view returns (uint256){
        SimpleStorage ss = SimpleStorage(address(SimpleStorageArray[_SimpleStorageIndex])) ; 
        return ss.retrieve() ; 
    }
}


// Inheritance: 

// in the 3rd line if : contract StorageFactory is SimpleStorage{
//     ...
// }
// is used, all function of SimpleStorage are  inherited into StorageFactory
// and will be visible when the contract has been deployed. 