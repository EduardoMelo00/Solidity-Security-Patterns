// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OverflowUnderflowExample {
    uint256 public maxUint = type(uint256).max; // This sets maxUint to 2^256 - 1
    uint256 public minUint = 0;

    function testOverflow() public {
        // This will revert because adding 1 to maxUint causes an overflow
        maxUint += 1;
    }

    function testUnderflow() public {
        // This will revert because subtracting 1 from minUint causes an underflow
        minUint -= 1;
    }
}
