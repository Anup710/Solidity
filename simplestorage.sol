pragma solidity >=0.5.0 <=0.6.0 ; //defining the version of solidity

//^ means any version >6, <7 is fine for the complier. Switching between versions is imp. 

contract SimpleStorage {
    
    uint256 favouritenumber;
    bool favbool ;

    struct People{
        uint256 choicenumber ;
        string name ;
    }
    // People[] public people ;

    People public person = People({choicenumber: 45 , name: "Anup"}) ;

    function store (uint256 _favouritenumber) public {
        favouritenumber = _favouritenumber ;
    }

    function retrieve() public view returns(uint256) {
        return favouritenumber ;
    }
}


