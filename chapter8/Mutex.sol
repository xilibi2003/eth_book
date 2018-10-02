contract Mutex {
    bool locked;
    modifier noReentrancy() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }
​
    // 防止递归调用
    // return 7 之后，locked = false 依然会执行
    function f() public noReentrancy returns (uint) {
        require(msg.sender.call());
        return 7;
    }
}
