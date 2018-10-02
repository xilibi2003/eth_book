pragma solidity ^0.4.0;

// 不应该使用这个合约
contract Fund {
    // Mapping of ether shares of the contract
    mapping(address => uint) shares;
    // Withdraw your share
    function withdraw() public {
        if (msg.sender.send(shares[msg.sender]))
            shares[msg.sender] = 0;
    }
}


//不应该使用这个合约
contract Fund {
    // Mapping of ether shares of the contract
    mapping(address => uint) shares;
    // Withdraw your share
    function withdraw() public {
        if (msg.sender.call.value(shares[msg.sender])())
            shares[msg.sender] = 0;
    }
}

// 更好  遵循： 检查—生效—交互
contract Fund {
    // Mapping of ether shares of the contract
    mapping(address => uint) shares;
    // Withdraw your share
    function withdraw() public {
        var share = shares[msg.sender];
        shares[msg.sender] = 0;
        msg.sender.transfer(share);
    }
}
