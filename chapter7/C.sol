pragma solidity ^0.4.16;
​
contract C {
    uint[] data;
​
    function f() public pure returns (uint, bool, uint) {
        return (7, true, 2);
    }
​
    function g() public {
        // 声明可赋值
        var (x, b, y) = f();
        // 赋值已声明过的变量
        (x, y) = (2, 7);
        // 交换变量值。只适用于值类型变量
        (x, y) = (y, x);
​
        // 支持省略一些元素，如果元组是以空元素为结尾，则其余部分可以省略
        (data.length,) = f();       // 设置长度为7
        // 开头也可以省略
        (,data[3]) = f(); // 设置 data[3]为2
        (x,) = (1,);   // 设置x为1
​
        // 注意 (1,) 是一个一个元素的元组，(1) 只是1。
    }
}
