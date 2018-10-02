pragma solidity ^0.4.0;
​
contract C {
    
    uint [] public u = [1, 2, 3];    // 生成访问器
    string  s = "abcdefg";
​
    uint[] c;  //storage
    function g(){
        c = new uint[](7);
        c.length = 10;   //可以修改storage的数组
        c[9] = 100;
    }
    
    function h() public  returns (uint) {
        return bytes(s).length;
    }
    
    function f() public  returns (byte) {
        return bytes(s)[1];     // 转为数组访问
    }
​
}
