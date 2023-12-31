// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SendBack.sol";

contract CounterTest is Test {
  SendBack public sendBack;

  uint256 internal ownerPrivateKey;
  address internal owner;

  function setUp() public {
    sendBack = new SendBack();
  }

  function testSendBack() public {
    vm.deal(owner, 10 ether);
    vm.prank(owner);
    uint256 balanceBefore = address(owner).balance;
    (bool success, ) = address(sendBack).call{value: 10 ether}("");
    require(success, "fail send eth to contract");
    uint256 balanceAfter = address(owner).balance;
    require(balanceBefore == balanceAfter, "fail test send back");
  }
}
