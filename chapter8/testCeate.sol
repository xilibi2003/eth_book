pragma solidity ^0.4.0;

contract D {
    uint x;
    function D(uint a) public payable {
        x = a;
    }
}

contract C {
    D d = new D(4);         // 将作为C构造的一部分被执行

    function createD(uint arg) public {
        D newD = new D(arg);
    }

    function createAndEndowD(uint arg, uint amount) public payable {
        // 在创建合约时发送以太币
        D newD = (new D).value(amount)(arg);
    }
}
