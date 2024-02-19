// SPDX-License-Identifier: MIT

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

    function contributeToContract() public payable
    {
        storageBalances[msg.sender] += msg.value;
        require(msg.value > 1000 wei, "Storage balance: Insufficient");
    }

    function addNewMember(address _newMember) public payable
    {
        storageBalances[_newMember] += msg.value;
        require(storageBalances[_newMember] == 0, "Address already contributed");
    }

    function changeContractOwner(address _newOwner) public
    {
        require(msg.sender == contractOwner, "You are not authorized");
        contractOwner = _newOwner;
    }
}
