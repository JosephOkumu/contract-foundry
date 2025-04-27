// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        Counter counter = new Counter();
        vm.stopBroadcast();
        // Log the deployed address
        console2.log("Counter deployed to:", address(counter));
    }
}