// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./LSDWrapper.sol";

contract LSDTest is Test {
    LSDWrapper wrapper;
    address user = address(0xABC);

    function setUp() public {
        wrapper = new LSDWrapper();
    }

    function testDeposit() public {
        vm.deal(user, 10 ether);
        vm.prank(user);
        wrapper.deposit{value: 1 ether}();

        assertEq(wrapper.lsToken().balanceOf(user), 1 ether);
        assertEq(address(wrapper).balance, 1 ether);
    }
}
