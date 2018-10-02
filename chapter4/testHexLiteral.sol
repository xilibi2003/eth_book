pragma solidity ^0.4.18;
​
contract testType2{
    
    function hexLiteralBytes() public returns (bytes2, bytes1, bytes1) {
        bytes2 a = hex"aabb";
        return (a, a[0], a[1]);
    }
}
