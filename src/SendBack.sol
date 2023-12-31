// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

error failSendBackAA();

contract SendBack {
  receive() external payable {
    (bool success, ) = msg.sender.call{value: msg.value}("");
    if (!success) revert failSendBackAA();
  }
}