pragma solidity ^0.4.16;
​
contract owned {
    function owned() { owner = msg.sender; }
    address owner;
}
​
// is 表示继承。继承的合约可以访问所有非private成员（包括内部函数及状态变量）
contract mortal is owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}
​
// 这是一个抽象合约，仅提供了一个接口函数（没有函数体），这样的合约仅能当接口使用
contract Config {
    function lookup(uint id) public returns (address adr);
}
​
contract NameReg {
    function register(bytes32 name) public;
    function unregister() public;
 }
​
// 多继承，注意 mortal 的基类也是owned
contract named is owned, mortal {
    function named(bytes32 name) {
        Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
        NameReg(config.lookup(1)).register(name);
    }
​
    // 函数可以复写，需要保持参数与类型和父类一致，否则会报错
    function kill() public {
        if (msg.sender == owner) {
            Config config = Config(0xD5f9D8D94886E70b06E474c3fB14Fd43E2f23970);
            NameReg(config.lookup(1)).unregister();
            // 可以调用指定的函数
            mortal.kill();
        }
    }
}
​
// 如果构造函数有参数，则需要在继承时提供参数
contract PriceFeed is owned, mortal, named("GoldFeed") {
   function updateInfo(uint newInfo) public {
      if (msg.sender == owner) info = newInfo;
   }
​
   function get() public view returns(uint r) { return info; }
​
   uint info;
}
