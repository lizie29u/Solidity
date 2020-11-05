pragma solidity ^0.5.0;

// lvl 3: equity plan
contract DeferredEquityPlan {
   
    uint fakenow = now;
   
    address human_resources;

    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract

    //Set the total shares and annual distribution
    uint total_shares = 1000;
    uint annual_distribution = 250;
    
   
    uint start_time = fakenow; // permanently store the time this contract was initialized

    //Set the `unlock_time` to be 365 days from now
    uint unlock_time = fakenow+365 days;

    uint public distributed_shares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function fastforward() public {
    fakenow += 100 days;
    }
    
        function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");

        // Add "require" statements to enforce that:
        
        require(unlock_time <= fakenow, "It is not yet time to unlock.");
        require(distributed_shares < total_shares, "You have exceeded the maximum number of shares.");

       
        unlock_time += 365 days; //Add 365 days to the `unlock_time`

        //Calculate the shares distributed
        distributed_shares = (fakenow - start_time) / 365 days *  annual_distribution; 

        // double check in case the employee does not cash out until after 5+ years
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
}
