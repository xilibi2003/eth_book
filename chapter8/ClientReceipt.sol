pragma solidity ^0.4.0;
​
contract ClientReceipt {
    event Deposit(
        address indexed _from,
        bytes32 indexed _id,
        uint _value
    );
​
    function deposit(bytes32 _id) public payable {
        // 使用event来触发事件
        // 任何对该函数的调用都可以通过JavaScript API监听到
        emit Deposit(msg.sender, _id, msg.value);
    }
}
