pragma solidity ^0.4.18;
​
contract testType{
    
    function add(uint x, uint y) public returns (uint z){
        z = x + y;
    }
​
    function divide(uint x, uint y ) public returns (uint z) {
        z = x / y;
    }
​
    function leftshift(int x, uint y) public returns (int z){
        z = x << y;
    }
    
    function rightshift(int x, uint y) public returns (int z){
        z = x >> y;
    }  
​
}
