pragma solidity ^0.4.16;
​
contract testTUnit {
​
    function currTimeInSeconds() public pure returns (uint256){
        return now;
    }
​
    function f(uint start, uint daysAfter) public {
        if (now >= start + daysAfter * 1 days) {
        // ...
        }
    }
}
