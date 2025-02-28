// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Event {
    event TestEvent(address indexed from, uint256 amount, bool isEven);

    function emitEvent(uint256 amount, bool isEven) public {
        emit TestEvent(msg.sender, amount, isEven);
    }

}
