// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title The Check-Effects-Interactions pattern is a coding practice that helps prevent reentrancy attacks. The idea is to perform checks, then update the state (effects), and only after that interact with external contracts (interactions). This ensures that the contract’s state is updated before any external calls are made, thereby reducing the risk of reentrancy.
/// @author Eduardo Melo
/// @notice 1 . Check: The contract checks if the sender has enough balance,
/// 2. Effect: The balance of the sender is updated (decreased by the withdrawal amount).
/// 3. Interaction: The contract then interacts with an external address (sending Ether to the sender).
/// @dev Explain to a developer any extra details
contract VulnerableContract {
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        (bool success, ) = msg.sender.call{value: amount}(""); // Interaction

        require(success, "Transfer failed");

        balances[msg.sender] -= amount; // Effect
    }
}
