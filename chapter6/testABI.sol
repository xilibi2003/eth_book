pragma solidity ^0.4.24;

contract testABI {
        function abiEncode() public constant returns (bytes) {
        abi.encode("string");  // 计算string 的ABI编码
        return abi.encode("baz(uint,address)"); //计算函数ABI编码
    }
}
