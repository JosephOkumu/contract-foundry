// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 public count;
    
    // function to get the current count
    function get() public view returns (uint256) {
        return count;
    }

    // function to increment count by 1
    function inc() public {
        count += 1;
    }

    // function to decrement count by 1
    function dec() public {
        // prevent underflow
        require(count > 0, "Counter: cannot decrement below zero");
        count -= 1;
    }

    // function to reset count to zero
    function reset() public {
        count = 0;
    }
}