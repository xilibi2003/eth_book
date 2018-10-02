pragma solidity ^0.4.11;
​
​
contract modifysample {
​
    uint a = 10;
    
    modifier mf1 (uint b) {
        uint c = b;
        _;
        c = a;
        a = 11;
    }
    
     modifier mf2 () {
        uint c = a;
        _;
    }
    
    modifier mf3() {
        a = 12;
        return ;
        _;
        a = 13;
    }
    
    function test1() mf1(a) mf2 mf3 public   {
        a = 1;
    }
    
     function test2() public constant returns (uint)   {
        return a;  
    }  
}
