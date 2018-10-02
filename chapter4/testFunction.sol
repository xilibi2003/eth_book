pragma solidity ^0.4.18;

contract FunctionSelector {
// 变量f可以被赋值为函数a或函数b
  function select(bool useB, uint x) returns (uint z) {
    var f = a;
    if (useB) f = b;
    return f(x);
  }
​
  function a(uint x) returns (uint z) {
    return x * x;
  }
​
  function b(uint x) returns (uint z) {
    return 2 * x;
  }
}


contract Selector {
  function f() public view returns (bytes4) {
      return this.f.selector;
  }
}
