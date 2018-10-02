pragma solidity ^0.4.16;
​
contract controlTest {
    function testWhile() pure public returns (uint) {
        uint i = 0;
        uint sumOfOdd = 0;
​
        while (true) {
           i++;
           if (i % 2 == 0) {
                continue;
            }
            
            if (i>10) {
                break;
            }
            
            sumOfOdd += i;
        }
        return sumOfOdd;
    }
​
​
    function testfor() pure public returns (uint , uint) {
         uint sumOfOdd = 0;
         uint sumofEven = 0;
        for (uint i = 0; i < 10; i++) {
            if (i % 2 == 0) {
                sumofEven += i;
            } else {
                sumOfOdd += i;
            }
        }
        return (sumOfOdd, sumofEven);
    }
}
