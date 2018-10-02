pragma solidity ^0.4.16;
​
contract testUnit {
    function tf() public pure returns (bool) {
      if (1 ether == 1000 finney){
          return true;
      }
      return false;
    }
    
    function ts() public pure returns (bool) {
      if (1 ether == 1000000 szabo){
          return true;
      }
      return false;
    }
    
    function tgw() public pure returns (bool) {
      if (1 ether == 1000000000000000000 wei){
          return true;
      }
      return false;
    }
}
