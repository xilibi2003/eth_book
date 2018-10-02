pragma solidity ^0.4.18;
​
contract testType2{
    function interLiteral() public returns (uint, uint) {
        return ((2**800 + 1)  2**800,  0.5*8);
    }
}
