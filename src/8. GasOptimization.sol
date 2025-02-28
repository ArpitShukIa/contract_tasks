// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract GasOptimization {
    uint128 public count;
    uint128 public immutable START_VALUE;
    uint8 public constant STEP = 10;

    event CountIncreased(uint128 newCount);

    constructor(uint128 _start) {
        START_VALUE = _start;
        count = _start;
    }

    function increment() external {
        unchecked {
            count += STEP;
        }
        emit CountIncreased(count);
    }

    function reset() external {
        count = START_VALUE;
    }
}
