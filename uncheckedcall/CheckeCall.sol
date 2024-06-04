// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CheckedCall {
    function sendEther(address payable recipient, uint256 amount) public {
        // Low-level call to send Ether
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Transfer failed");
    }
}
