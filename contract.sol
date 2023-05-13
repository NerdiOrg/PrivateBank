// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.4;

contract PrivateBank {
    address public owner;
    mapping (address => bool) private approvedAddresses;

    constructor() {
        owner = msg.sender;
        approvedAddresses[owner] = true;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    modifier onlyApproved() {
        require(approvedAddresses[msg.sender] == true, "Caller is not approved");
        _;
    }

    receive() external payable {
        deposit();
    }

    function deposit() private returns(bool){
        require(msg.value > 0, "Please do not attempt to deposit a value of 0 tokens.");
        return true;
    }

    function approveAddress(address _address) public onlyOwner {
        approvedAddresses[_address] = true;
    }

    function removeAddress(address _address) public onlyOwner {
        require(_address != owner, "The owner address cannot be removed from this contract's approved addresses list.");
        approvedAddresses[_address] = false;
    }

    function isApproved(address _address) public view onlyApproved returns(bool) {
        return approvedAddresses[_address];
    }

    
    function withdraw(uint amountInWei) public onlyApproved returns(bool){
        require(amountInWei > 0, "Please do not attempt to withdraw 0.00 wei.");
        require(address(this).balance >= amountInWei, "Withdrawal declined: Insufficient funds available in contract balance.");
        (bool sent, ) = payable(msg.sender).call{value: amountInWei}("");
        require(sent, "There was an issue sending the requested tokens.");
        return sent;
    }

    function withdrawAll() public onlyApproved returns(bool){
        (bool sent, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(sent, "There was an issue sending the remaining tokens in your account balance.");
        return sent;
    }

    function checkBalance() public view onlyApproved returns(uint){
        return address(this).balance;
    }
}
