// SPDX-License-Identifier: MIT
//0x0000000000000000000000000000000000000000

pragma solidity ^0.8.13;

contract ErrorHandlingContract {

    // Owner of the contract 
    address public contractOwner;

    // Mapping to keep track of storage balances
    mapping (address => uint) public storageBalances;

    constructor (){
        // Setting the deployer as the owner of the contract.
        contractOwner = msg.sender;
    }

    function contribute() 
        public 
        payable
    {
        storageBalances[msg.sender] += msg.value;
        require(msg.value > 2000 wei, "Insufficient storage balance");
    }

    function addNewMember(address _newMember) 
        public 
        payable
    {
        storageBalances[_newMember] += msg.value;
        require(_newMember != address(0), "Invalid address");
    }

    function changeContractOwner(address _newOwner) 
        public
    {
        require(msg.sender == contractOwner, "You are not the owner");
        contractOwner = _newOwner;
    }
}
