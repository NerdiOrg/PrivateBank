# PrivateBank
A Solidity smart contract to manage a private bank account with approved address access for spouses, fund managers, or for your other personal addresses. Addresses on the approved list can withdraw any amount of available funds, and the contract can receive deposits from any source.

## Prerequisites
You need to have a basic understanding of Solidity to comprehend this contract. Knowledge of Ethereum and smart contracts is also necessary. 

You must fully read and understand the LICENSE file found in this project's root directory. I make no guarantees or assurances as to the security, use, or application of the code or files found in this repository.

## IPFS CONFIRMATION
To help increase the decentralized nature of this project, you may identify each contract version's source code on IPFS.

CURRENT / LATEST (v0.1) - `bafkreihzts4bbmlitfkeovzo4sb5wyltgyt6z2lgjbufmzp2iu5oueu56i`
https://ipfs.io/ipfs/bafkreihzts4bbmlitfkeovzo4sb5wyltgyt6z2lgjbufmzp2iu5oueu56i



## Code Explanation

### Pragma Solidity
`pragma solidity ^0.8.4;` indicates that this contract is compatible with Solidity compiler version 0.8.4 and above, but less than version 0.9.0.

### Contract Variables
The `PrivateBank` contract declares an `owner` address and a mapping `approvedAddresses` for holding the list of approved addresses that can withdraw funds. The owner can add or remove addresses as needed.

### Constructor
The `constructor` function is executed upon contract creation. It sets the `owner` to the address that deployed the contract and adds this address to the `approvedAddresses`.

### Modifiers
Two modifiers are used in this contract: `onlyOwner` and `onlyApproved`. These are used to restrict function access. `onlyOwner` allows only the owner to call a function. `onlyApproved` allows only approved addresses to call a function.

### Receive Function
The `receive` function is triggered when the contract receives Ether without any other data. It calls the `deposit` function.

### Deposit Function
The `deposit` function is private and can only be called from this contract. It requires that the sent value is greater than 0 and returns true if the deposit is successful.

### ApproveAddress Function
The `approveAddress` function allows the contract owner to add an address to the `approvedAddresses`.

### RemoveAddress Function
The `removeAddress` function allows the contract owner to remove an address from the `approvedAddresses`. The function ensures that the owner's address cannot be removed.

### IsApproved Function
The `isApproved` function checks if an address is approved. It is viewable by all approved addresses and returns a boolean indicating whether the provided address is approved.

### Withdraw Function
The `withdraw` function allows approved addresses to withdraw a specific amount of Ether from the contract. It checks if the requested amount is available and sends the Ether to the caller.

### WithdrawAll Function
The `withdrawAll` function allows approved addresses to withdraw all Ether from the contract. It sends all the contract's balance to the caller.

### CheckBalance Function
The `checkBalance` function allows approved addresses to check the balance of the contract. It returns the current contract balance.
