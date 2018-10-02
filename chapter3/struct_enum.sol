pragma solidity ^0.4.0;

contract Ballot {
    struct Voter {      // 结构类型
        uint weight;
        bool voted;
        address delegate;
        uint vote;
    }

    enum State { Created, Locked, Inactive } // 枚举类型

}
