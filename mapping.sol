// SPDX-Lisence-Identifier: MIT

pragma solidity >= 0.5.0 < 0.6.0 ;

contract Store_and_swap {
    uint256 favno ;
    bool favbool ;

    struct People{
        string name ;
        uint256 favno ;
    }

    People[] public people; 
    mapping (string => uint256) public  nametofavno ;

    function store (uint256 _favouritenumber )public {
        favno = _favouritenumber ;
    }

    function retrieve () public view returns (uint256) {
        return favno ;
    }

    function addperson (string memory _name, uint256 _favouritenumber) public {
        people.push(People(_name, _favouritenumber)) ;
        nametofavno[_name] = _favouritenumber ; //stores the favno of that person in _name index
    }
}

//only functions store and addperson are causing a state change in the blockchain 
// and will therefore demand a gas fee when called .(metamask pops up)

// see 2:00:00 to 2:00:09 of the free code camp video for execution. 
