pragma solidity ^0.4.0;
​
contract Test {
    
    // 由于没有payable ，向这个合约转账时会发生异常
    function() public { x = 1; }
    uint x;
}
​
​
// 保存所有接收的以太币，无法拿回
contract Sink {
    function() public payable { }
}
​
contract Caller {
    function callTest(Test test) public {
        test.call(0xabcdef01); // 不存在的hash
        // results in test.x becoming == 1.
​
        // 无法编译，通过其他方式发送则失败
        //test.send(2 ether);
    }
}
