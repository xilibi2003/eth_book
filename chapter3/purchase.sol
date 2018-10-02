pragma solidity ^0.4.11;

contract Purchase {
    address public seller;

    modifier onlySeller() { // 声明了一个修改器
        require(msg.sender == seller);
        _;
    }

    function abort() public onlySeller { // 修改器的使用
        // ...
    }
}
