pragma solidity ^0.4.11;
​
contract owned {
    function owned() public { owner = msg.sender; }
    address owner;
​
    // 定义了一个函数修改器，可被继承
    // 修改时，函数体被插入到 “_;” 处
    // 不符合条件时，将抛出异常
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}
​
contract mortal is owned {
    //  使用继承的onlyOwner
    function close() public onlyOwner {
        selfdestruct(owner);
    }
}
​
contract priced {
    // 函数修改器可接收参数
    modifier costs(uint price) {
        if (msg.value >= price) {
            _;
        }
    }
}
​
contract Register is priced, owned {
    mapping (address => bool) registeredAddresses;
    uint price;
​
    function Register(uint initialPrice) public { price = initialPrice; }
​
    // 需要提供payable 以接受以太
    function register() public payable costs(price) {
        registeredAddresses[msg.sender] = true;
    }
​
    function changePrice(uint _price) public onlyOwner {
        price = _price;
    }
}
