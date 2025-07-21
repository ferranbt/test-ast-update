// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Other} from "../src/Other.sol";

contract OtherTest is Test {
    Other public other;

    function test_Other() public {
        other = new Other();
        other.increment2();
    }
}
