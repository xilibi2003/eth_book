pragma solidity ^0.4.21;
​
contract Coin {
    // 关键字public 让状态变量可以从外部读取
    address public minter;
    mapping (address => uint) public balances;
​
    // 定义了一个事件，客户端可以根据事件变化做出反应
    event Sent(address from, address to, uint amount);
​
    // 构造函数，只有在创建合约时运行一次
    constructor()  public {
        minter = msg.sender;
    }
​
    // 挖矿方法，用来产生新的货币
    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return;
        balances[receiver] += amount;
    }
​
    // 发送货币
    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
