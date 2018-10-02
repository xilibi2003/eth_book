// 这个代码片段是无法编译的
​
pragma solidity ^0.4.16;
​
contract ScopingErrors {
    function scoping() public {
        uint i = 0;
​
        while (i++ < 1) {
            uint same1 = 0;
        }
​
        while (i++ < 2) {
            uint same1 = 0;  // 出错
        }
    }
​
    function minimalScoping() public {
        {
            uint same2 = 0;
        }
​
        {
            uint same2 = 0;  //出错
        }
    }
​
    function forLoopScoping() public {
        for (uint same3 = 0; same3 < 1; same3++) {
        }
​
        for (uint same3 = 0; same3 < 1; same3++)         }
    }
}
