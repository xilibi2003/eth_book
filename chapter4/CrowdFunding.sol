pragma solidity ^0.4.11;
​contract CrowdFunding {
    // 定义一个包含两个成员的新类型
    struct Funder {
        address addr;
        uint amount;
    }
​
    struct Campaign {
        address beneficiary;
        uint fundingGoal;
        uint numFunders;
        uint amount;
        mapping (uint => Funder) funders;
    }
​
    uint numCampaigns;
    mapping (uint => Campaign) campaigns;
​
    function newCampaign(address beneficiary, uint goal) public returns (uint campaignID) {
        campaignID = numCampaigns++; // campaignID作为一个变量返回
        // 创建一个结构体实例，存储在storage上，放入mapping里
        campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0);
    }
​
    function contribute(uint campaignID) public payable {
        Campaign storage c = campaigns[campaignID];
        // 用mapping对应项创建一个结构体引用
        // 也可以用 Funder(msg.sender, msg.value) 来初始化
        c.funders[c.numFunders++] = Funder({addr: msg.sender, amount: msg.value});
        c.amount += msg.value;
    }
​
    function checkGoalReached(uint campaignID) public returns (bool reached) {
        Campaign storage c = campaigns[campaignID];
        if (c.amount < c.fundingGoal)
            return false;
        uint amount = c.amount;
        c.amount = 0;
        c.beneficiary.transfer(amount);
        return true;
    }
}
