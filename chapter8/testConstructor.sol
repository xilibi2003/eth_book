pragma solidity ^0.4.22;
​
contract A {
    uint public a;
​
    constructor (uint _a) internal {
        a = _a;
    }
}
​
contract B is A(1) {
    constructor () public {}
}


contract Base {
    uint x;
    constructor (uint _x) public { x = _x; }
}
​
contract Derived1 is Base(7) {
    constructor(uint _y) public {
    }
}
​
contract Derived2 is Base {
    constructor(uint _y) Base(_y * _y) public {
    }
}​
