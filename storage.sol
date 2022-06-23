pragma solidity ^0.6.0; 

contract MyContract {
    string value; 

    constructor() public {
        value = "DefaultValue" ;
    }

    function get() public view returns(string) {
        return value; 
    }

    function set(string _value) public {
        value = _value; 
    } 
}