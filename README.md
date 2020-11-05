# Solidity

In this assignment, we have created three (3) smart contracts to automate some company financial operations. The contracts were all tested on the local network and then deployed to the Kovan network.

### Contract #1 - Associate Profit Splitter
Deployed on the Kovan network
contract addres: 0xb137900410Df13892Ebf31EDA7086f846FFB6cB6

This contract will be used by human resources to pay employees quickly and efficiently. The contract  will accept ether, and divide it evenly among associate-level employees.

The three (3) associate level employees have been defined as
employee _one, employee _two and employee _three. The constructor function has been used to program their payable addresses into the contract.

The deposit function will do the following
1 - Accept the deposit amount from HR
2 - Split the amount evenly among the 3 employees
3 - Transfer the respective portions to each employee
4 - Send back any potential remainder to HR

The contract will not accept deposits except through calling the deposit function.

The balance function will serve as a sort of test function to ensure that the deposit function is returning the remainders to HR.  Therefore, the balance function, should always return 0.

See copy of codes here -  [`AssociateProfitSplitter.sol`](AssociateProfitSplitter.sol)


### Contract #2 -Tiered Profit Splitter
Deployed on the Kovan network
contract addres: 0x7bdbc966dDE467ca4182CD3D69c6399B09852dC8

This contract will be used to split profits between three (3) employees based on predetermined percentages (60%, 25% and 15%), after the amounts have been converted to points.

The employees have been defined as
employee _one, employee _two and employee _three. The constructor function has been used to program their payable addresses into the contract.

The deposit function will do the following
1 - convert the deposit amount to points
2 - Apply percentage to calculate the amount for the employee
3 - Keep a running balance of the total allocated 
4 - transfer the respective amounts to each employee
5 - Calculate the difference between the original deposit and the total allocated, then  send this difference to employee _one.  

The contract will not accept deposits except through calling the deposit function.

The balance function will serve as a sort of test function to ensure that the deposit function is executing properly. Since all of the ether should be transferred to employees, the balance function should always return 0.


See copy of codes here: [`TieredProfitSplitter.sol`](TieredProfitSplitter.sol)


### Contract #3 -Deferred Equity Plan
Deployed on the Kovan network
contract addres: 0x8B41C4145643270db98A8A4dBfe1646AF019650c

This contract will be used to manage an employee's "deferred equity incentive plan," which distributes 1000 shares over four years to the employee, assuming the employee is still active at the end of each vesting period. 250 shares will be distributed at the end of each vesting period which is one year (365 days).

The start time will be set as "now" and 365 days added to calculate the unlock time. 

The constructor function has been used to program the employee's payable addresses and also to set human resources as the message sender.

The distribution function will do the following
1 - Verify that the vesting period is met for unlocking
2 - Set the next unlock time
3 - Distribute shares 

The contract will not accept deposits of ether.

The contract can be deactivated by either HR or the employee
See copy of codes here: [`DeferreEquityPlan.sol`](DeferredEquityPlan.sol)
