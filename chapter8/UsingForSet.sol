pragma solidity ^0.4.16;
​
// 库合约代码和上一节一样
library Set {
  struct Data { mapping(uint => bool) flags; }
​
  function insert(Data storage self, uint value)
      public
      returns (bool)
  {
      if (self.flags[value])
        return false; // already there
      self.flags[value] = true;
      return true;
  }
​
  function remove(Data storage self, uint value)
      public
      returns (bool)
  {
      if (!self.flags[value])
          return false; // not there
      self.flags[value] = false;
      return true;
  }
​
  function contains(Data storage self, uint value)
      public
      view
      returns (bool)
  {
      return self.flags[value];
  }
}
​
contract C {
    using Set for Set.Data; // 这是一个关键的变化
    Set.Data knownValues;
​
    function register(uint value) public {
        // 现在 Set.Data都对应的成员方法
        // 效果和Set.insert(knownValues, value)相同
        require(knownValues.insert(value));
    }
}
