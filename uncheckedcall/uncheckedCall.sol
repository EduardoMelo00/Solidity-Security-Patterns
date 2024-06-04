// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncheckedCall {
    function sendEther(address payable recipient, uint256 amount) public {
        // Low-level call to send Ether
        recipient.call{value: amount}(""); // Return value is not checked
    }
}
