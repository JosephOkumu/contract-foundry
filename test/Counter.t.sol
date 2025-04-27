// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
    }

    function test_InitialCount() public {
        assertEq(counter.get(), 0, "Initial count should be 0");
    }

    function test_Increment() public {
        counter.inc();
        assertEq(counter.get(), 1, "Count should be 1 after increment");
        counter.inc();
        assertEq(counter.get(), 2, "Count should be 2 after another increment");
    }

    function test_Decrement() public {
        counter.inc();
        counter.dec();
        assertEq(counter.get(), 0, "Count should be 0 after increment and decrement");
    }

    function test_DecrementUnderflow() public {
        vm.expectRevert("Counter: cannot decrement below zero");
        counter.dec();
    }

    function test_Reset() public {
        counter.inc();
        counter.inc();
        counter.reset();
        assertEq(counter.get(), 0, "Count should be 0 after reset");
    }
}