pragma solidity ^0.4.0;
​
contract DeleteExample {
    uint data;
    uint[] dataArray;
​
    function f() public {
      //值传递
        uint x = data;
        delete x;    //删除x不会影响data
        delete data; // 删除data同样不会影响x，因为是值传递，保存的是一份原值拷贝
        
          //引用赋值
        uint[] storage y = dataArray;
        //删除dataArray会影响y，y将被赋值为初值
        delete dataArray;  
        
        
        //报错，因为删除的是一个赋值操作，所以不能向引用类型的storage直接赋值
        //delete y;
​
    }
}
