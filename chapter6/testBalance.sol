pragma solidity ^0.4.22;
contract testBalance{
    function  balanceOf() public constant returns (uint) {
        return this.balance; // this 表示当前合约
    }
}

contract Mark {
    function Deposit() payable {}
    function call(address a) {   // 调用时需要传入 testBalance合约的地址
        a.delegatecall(bytes4(keccak256 ("balanceOf()")));  //委托调用
          }
}
