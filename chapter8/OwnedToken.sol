pragma solidity ^0.4.16;
​
contract OwnedToken {
    // TokenCreator 是在下面定义一个合约类型
    TokenCreator creator;
    address owner;
    bytes32 name;
​
  
    constructor (bytes32 _name) public {
        owner = msg.sender;
        //地址转为TokenCreator合约
        creator = TokenCreator(msg.sender);
        name = _name;
    }
​
    function changeName(bytes32 newName) public {
        //只有创建者能改名
        if (msg.sender == address(creator))
            name = newName;
    }
​
    function transfer(address newOwner) public {
        // 只有owner能转移token
        if (msg.sender != owner) return;
        
        if (creator.isTokenTransferOK(owner, newOwner))
            owner = newOwner;
    }
}
​
// 用来创建合约
contract TokenCreator {
    function createToken(bytes32 name)
       public
       returns (OwnedToken tokenAddress)
    {
        // 创建token合约，返回合约地址
        return new OwnedToken(name);
    }
​
    function changeName(OwnedToken tokenAddress, bytes32 name)  public {
        tokenAddress.changeName(name);
    }
​
    function isTokenTransferOK(address currentOwner, address newOwner) public
        view
        returns (bool ok)
    {
       address tokenAddress = msg.sender;
        return (keccak256(newOwner) & 0xff) == (bytes20(tokenAddress) & 0xff);
    }
}
